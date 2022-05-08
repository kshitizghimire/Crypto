import Foundation

public protocol ModelLoadable {
	func load<T: Decodable>(for url: URL) async throws -> T
}
