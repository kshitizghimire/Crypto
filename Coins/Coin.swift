import Foundation

public struct Coin {
	public var id: String
	var symbol: String
	var name: String
	var image: String
}

extension Coin: Codable {}
extension Coin: Identifiable {}
extension Coin: Equatable {}
