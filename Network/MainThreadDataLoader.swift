import Foundation

/// A decorator for DataLoading which dispatches completion closure on main thread.
public struct MainThreadDataLoader: DataLoading {
    private let decoratee: DataLoading

    public init(
        dataLoader decoratee: DataLoading
    ) {
        self.decoratee = decoratee
    }

    public func load(for url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        decoratee.load(for: url) { result in
            self.performOnMainThread {
                completion(result)
            }
        }
    }

    private func performOnMainThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}
