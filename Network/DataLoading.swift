import Foundation

public protocol DataLoading {
    func load(for url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
