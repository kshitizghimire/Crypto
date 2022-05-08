import Coins
import Foundation
import Service
import SwiftUI

struct CoinsView_Previews: PreviewProvider {
	static var previews: some View {
		let model = [
			Coin(id: "0", symbol: "BTC", name: "Bitcoin", image: "http://google.com"),
			Coin(id: "1", symbol: "ETH", name: "Ethereum", image: "http://google.com"),
		]
		let coinLoader = CoinLoader(url: URL(string: "http://")!, modelLoader: MockModelLoader(model: model))
		let viewModel = CoinsViewModel(coinLoader: coinLoader)
		CoinsView(viewModel: viewModel)
	}
}
