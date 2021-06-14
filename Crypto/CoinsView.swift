//
//  CoinsView.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

import SwiftUI

struct CoinsView: View {
    
    @ObservedObject var viewModel = CoinsViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.searchResults(searchText: searchText), id: \.id) { coin in
                NavigationLink(destination: Text(coin.name)) {
                    CoinRowView(coin: coin)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Coins")
        }
        .onAppear {
            async {
                try? await viewModel.fetchCoins()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView()
    }
}

