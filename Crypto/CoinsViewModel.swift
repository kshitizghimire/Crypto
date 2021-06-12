//
//  CoinsViewModel.swift
//  Crypto
//
//  Created by Tiz on 11/6/21.
//
import Foundation

final class CoinsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    
    func fetchCoins() async throws {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=1000&page=1&sparkline=false")!
        let (data, _) = try await URLSession.shared.data(from: url)
        coins = try JSONDecoder().decode([Coin].self, from: data)
    }
    
    func searchResults(searchText: String) -> [Coin] {
        if searchText.isEmpty {
            return coins
        } else {
            return coins.filter { $0.name.contains(searchText)}
        }
    }
}
