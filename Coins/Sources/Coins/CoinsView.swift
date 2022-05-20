import SwiftUI

public protocol CoinLoadable {
	func load() async throws -> [Coin]
}

public struct CoinsView: View {
	@ObservedObject var viewModel: CoinsViewModel

	public init(viewModel: CoinsViewModel) {
		self.viewModel = viewModel
	}

	public var body: some View {
		List(viewModel.displayCoins) { coin in
			NavigationLink {
				CoinDetailView(coin: coin)
			} label: {
				CoinCellView(coin: coin)
			}
		}
		.searchable(text: $viewModel.searchText)
		.navigationTitle("Coins")
		.refreshable {
			await viewModel.fetchCoins()
		}
		.task {
			await viewModel.fetchCoins()
		}
	}
}
