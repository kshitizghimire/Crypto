//
//  CryptoApp.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

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
