import Coins
import Service
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
                let viewModel = CoinsViewModel(modelLoader: modelLoader)
                CoinsView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "bitcoinsign.circle")
                        Text("Coins")
                    }
            }
        }
    }
}
