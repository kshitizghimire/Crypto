import Foundation

public struct MockModelLoader<Model: Decodable>: ModelLoadable {
	let model: Model

	public init(model: Model) {
		self.model = model
	}

	public func load<T: Decodable>(for _: URL) async throws -> T {
		model as! T
	}
}
