//
//  CoinsViewModel.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//

import Foundation
import UIKit

final class CoinsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    
    func fetchCoins() async throws {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false")!
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        self.coins = try JSONDecoder().decode([Coin].self, from: data)
    }
}
