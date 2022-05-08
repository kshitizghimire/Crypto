import Foundation

public protocol DataLoadable {
	func load(for url: URL) async throws -> Data
}
