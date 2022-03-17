import Foundation

public struct RemoteDataLoader: DataLoading {
    private let session: URLSession

    public init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    public func load(for url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }
}
