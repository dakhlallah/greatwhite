import XCTest

final class TrevioUITests: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.navigationBars["Login"].exists)
    }
}
