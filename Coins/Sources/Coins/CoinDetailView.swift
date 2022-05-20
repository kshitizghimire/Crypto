import SwiftUI

struct CoinDetailView: View {
	let coin: Coin
	var body: some View {
		Text(coin.name)
	}
}

struct CoinDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CoinDetailView(
			coin: Coin(id: "0", symbol: "BTC", name: "Bitcoin", image: "http://google.com")
		)
	}
}
