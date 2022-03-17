import Foundation

public protocol DataLoading {
    func load(for url: URL) async throws -> Data
}
