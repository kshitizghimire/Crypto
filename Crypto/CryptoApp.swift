import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CoinsView()
                    .tabItem {
                        Image(systemName: "bitcoinsign.circle")
                        Text("Coins")
                    }
            }
        }
    }
}
