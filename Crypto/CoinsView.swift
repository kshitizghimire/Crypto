//
//  CoinsView.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

import SwiftUI

struct CoinsView: View {
    
    @State var coins: [Coin] = []
    var body: some View {
        NavigationView {
            List(coins, id: \.id) { coin in
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.headline)
                    Text(coin.symbol)
                }
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let decodedResponse = try? JSONDecoder().decode([Coin].self, from: data) {
                self.coins = decodedResponse
            }
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView()
    }
}

