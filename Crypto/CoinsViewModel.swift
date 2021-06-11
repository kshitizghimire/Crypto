//
//  CoinsViewModel.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

import Foundation

final class CoinsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    
    func loadData() {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let decodedResponse = try? JSONDecoder().decode([Coin].self, from: data) {
                DispatchQueue.main.async {
                    self.coins = decodedResponse
                }
            }
        }.resume()
    }
}
