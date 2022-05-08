import Coins
import Foundation
import Service

public struct CoinLoader: CoinLoadable {
	public init(url: URL, modelLoader: ModelLoading) {
		self.url = url
		self.modelLoader = modelLoader
	}

	private let url: URL
	private let modelLoader: ModelLoading

	public func load() async throws -> [Coin] {
		try await modelLoader.load(for: url)
	}
}
