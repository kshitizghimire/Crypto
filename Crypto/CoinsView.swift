//
//  CoinsView.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

import SwiftUI

struct CoinsView: View {
    
    @ObservedObject var viewModel = CoinsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coins, id: \.id) { coin in
                HStack {
                    AsyncImage(url: URL(string: coin.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Image(systemName: "arrow.up.message.fill")
                    }
                    .frame(width: 20, height: 20)
                    VStack(alignment: .leading) {
                        Text(coin.name)
                            .font(.headline)
                        Text(coin.symbol)
                    }
                }
            }
            .navigationBarTitle("Coins")
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
