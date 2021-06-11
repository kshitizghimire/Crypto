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
    
    func loadData() async throws {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let coins = try JSONDecoder().decode([Coin].self, from: data)
        self.coins = coins
    }
}
