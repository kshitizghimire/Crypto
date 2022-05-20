import SwiftUI

struct CoinCellView: View {
	let coin: Coin

	var body: some View {
		HStack {
			AsyncImage(url: URL(string: coin.image)) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
			} placeholder: {
				ProgressView()
			}
			.frame(width: 20, height: 20)
			VStack(alignment: .leading) {
				Text(coin.name)
					.font(.headline)
				Text(coin.symbol)
			}
		}
	}
}

struct CoinRowView_Previews: PreviewProvider {
	static var previews: some View {
		CoinCellView(coin: Coin(id: "1", symbol: "symbol", name: "name", image: "http://"))
	}
}
