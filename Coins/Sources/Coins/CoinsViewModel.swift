import Foundation

@MainActor public final class CoinsViewModel: ObservableObject {
	@Published var searchText = ""
	@Published private var coins: [Coin] = []
	private let coinLoader: CoinLoadable

	public init(
		coinLoader: CoinLoadable
	) {
		self.coinLoader = coinLoader
	}

	func fetchCoins() async {
		do {
			coins = try await coinLoader.load()

		} catch {}
	}

	var displayCoins: [Coin] {
		if searchText.isEmpty {
			return coins
		} else {
			return coins.filter { $0.name.contains(searchText) }
		}
	}
}
