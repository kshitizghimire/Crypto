import Foundation

public protocol ModelLoading {
	func load<T: Decodable>(for url: URL) async throws -> T
}
