import Coins
import Service
import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                let remoteDataLoader = RemoteDataLoader()
                let mainThreadDataLoader = MainThreadDataLoader(dataLoader: remoteDataLoader)
                let modelLoader = RemoteModelLoader(
                    dataLoader: mainThreadDataLoader,
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
