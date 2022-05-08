import Coins
import Foundation
import Loader

public struct CoinLoader: CoinLoadable {
	public init(url: URL, modelLoader: ModelLoadable) {
		self.url = url
		self.modelLoader = modelLoader
	}

	private let url: URL
	private let modelLoader: ModelLoadable

	public func load() async throws -> [Coin] {
		try await modelLoader.load(for: url)
	}
}
