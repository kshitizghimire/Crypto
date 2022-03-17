import Service
import SwiftUI

public struct CoinsView: View {
    @ObservedObject var viewModel: CoinsViewModel
    @State var searchText = ""

    public init(viewModel: CoinsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear
                .onAppear {
                    Task {
                        await viewModel.fetchCoins()
                    }
                }
        case .loading:
            ProgressView()
        case .loaded:
            NavigationView {
                List(viewModel.searchResults(searchText: searchText), id: \.id) { coin in
                    CoinRowView(coin: coin)
                }
                .searchable(text: $searchText)
                .navigationTitle("Coins")
            }
        case .failed:
            Color.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [
            Coin(id: "0", symbol: "BTC", name: "Bitcoin", image: "http://google.com"),
            Coin(id: "1", symbol: "ETH", name: "Ethereum", image: "http://google.com"),
        ]
        let mockModelLoader = MockModelLoader(model: model)
        let viewModel = CoinsViewModel(modelLoader: mockModelLoader)
        CoinsView(viewModel: viewModel)
    }
}
