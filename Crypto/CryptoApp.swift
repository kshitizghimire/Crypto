import Coins
import Loader
import SwiftUI

@main
struct CryptoApp: App {
	var body: some Scene {
		WindowGroup {
			TabView {
				let remoteDataLoader = RemoteDataLoader()
				let modelLoader = RemoteModelLoader(
					dataLoader: remoteDataLoader,
					decoder: JSONDecoder()
				)
				let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=1000&page=1&sparkline=false")!
				let coinLoader = CoinLoader(url: url, modelLoader: modelLoader)
				let viewModel = CoinsViewModel(coinLoader: coinLoader)
				NavigationView {
					CoinsView(viewModel: viewModel)
				}
				.tabItem {
					Image(systemName: "bitcoinsign.circle")
					Text("Coins")
				}
			}
		}
	}
}
