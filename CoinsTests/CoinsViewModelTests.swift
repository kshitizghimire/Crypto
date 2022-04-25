@testable import Coins
import Service
import XCTest

class CoinsViewModelTests: XCTestCase {
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	@MainActor func testDisplayCoins() throws {
		let model = [
			Coin(id: "0", symbol: "BTC", name: "Bitcoin", image: "http://google.com"),
			Coin(id: "1", symbol: "ETH", name: "Ethereum", image: "http://google.com"),
		]
		let mockModelLoader = MockModelLoader(model: model)
		let sut = CoinsViewModel(modelLoader: mockModelLoader, url: URL(string: "http://")!)
		XCTAssertEqual(sut.displayCoins, model)
	}
}
