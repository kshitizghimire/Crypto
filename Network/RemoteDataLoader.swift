import Foundation

public struct RemoteDataLoader: DataLoading {
    enum RemoteDataLoaderError: Error {
        case general
    }

    private let session: URLSession

    public init(
        session: URLSession = URLSession.shared
    ) {
        self.session = session
    }

    public func load(for url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode),
                  error == nil
            else {
                completion(.failure(RemoteDataLoaderError.general))
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
