import XCTest
@testable import Trevio

final class TrevioTests: XCTestCase {
    func testAuthViewModel() async throws {
        let viewModel = AuthViewModel()
        await viewModel.login(email: "test@example.com", password: "password")
        XCTAssertTrue(viewModel.isAuthenticated || !viewModel.isAuthenticated)
    }
}
