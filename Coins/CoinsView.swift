import Service
import SwiftUI

public struct CoinsView: View {
    @ObservedObject var viewModel: CoinsViewModel

    public init(viewModel: CoinsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.displayCoins) { coin in
                    CoinRowView(coin: coin)
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Coins")
            .refreshable {
                await viewModel.fetchCoins()
            }
        }
        .task {
            await viewModel.fetchCoins()
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
        let viewModel = CoinsViewModel(modelLoader: mockModelLoader, url: URL(string: "http://")!)
        CoinsView(viewModel: viewModel)
    }
}
