import SwiftUI

struct CoinRowView: View {
    let coin: Coin

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coin.image)) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                        .resizable()
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    ProgressView() // Acts as a placeholder.
                }
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
        CoinRowView(coin: Coin(id: "1", symbol: "symbol", name: "name", image: "http://"))
    }
}
