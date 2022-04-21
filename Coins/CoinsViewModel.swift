import Foundation
import Service

@MainActor public final class CoinsViewModel: ObservableObject {
	@Published var searchText = ""
	@Published private var coins: [Coin] = []
	private let modelLoader: ModelLoading
	private let url: URL

	public init(
		modelLoader: ModelLoading,
		url: URL
	) {
		self.modelLoader = modelLoader
		self.url = url
	}

	func fetchCoins() async {
		do {
			coins = try await modelLoader.load(for: url)

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
