import Foundation

struct Coin {
    var id: String
    var symbol: String
    var name: String
    var image: String
}

extension Coin: Codable {}
extension Coin: Identifiable {}
