import Foundation

final class CoinsViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Coin])
    }

    @Published private(set) var state = State.idle

    func fetchCoins() async {
        state = .loading
        do {
            let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=1000&page=1&sparkline=false")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            state = .loaded(coins)
        } catch {
            state = .failed(error)
        }
    }

    func searchResults(searchText: String) -> [Coin] {
        switch state {
        case .loaded(let coins):
            if searchText.isEmpty {
                return coins
            } else {
                return coins.filter { $0.name.contains(searchText) }
            }
        default:
            preconditionFailure()
        }
    }
}
