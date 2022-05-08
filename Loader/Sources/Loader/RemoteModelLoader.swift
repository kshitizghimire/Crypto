import Foundation

public struct RemoteModelLoader: ModelLoadable {
	let dataLoader: DataLoadable
	let decoder: JSONDecoder

	public init(dataLoader: DataLoadable, decoder: JSONDecoder) {
		self.dataLoader = dataLoader
		self.decoder = decoder
	}

	public func load<T: Decodable>(for url: URL) async throws -> T {
		let data = try await dataLoader.load(for: url)
		return try decoder.decode(T.self, from: data)
	}
}
