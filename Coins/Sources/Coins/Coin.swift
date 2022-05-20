import Foundation

public struct Coin {
	public var id: String
	var symbol: String
	var name: String
	var image: String

	public init(id: String, symbol: String, name: String, image: String) {
		self.id = id
		self.symbol = symbol
		self.name = name
		self.image = image
	}
}

extension Coin: Codable {}
extension Coin: Identifiable {}
extension Coin: Equatable {}
