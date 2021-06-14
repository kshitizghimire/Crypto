//
//  CoinRowView.swift
//  Crypto
//
//  Created by Tiz on 14/6/21.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
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
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: Coin(id: "1", symbol: "symbol", name: "name", image: "http://"))
    }
}
