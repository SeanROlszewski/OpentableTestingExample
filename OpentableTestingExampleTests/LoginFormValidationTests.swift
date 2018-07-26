import XCTest
@testable import OpentableTestingExample


class LoginFormValidationTests: XCTestCase {
    func testItAcceptsWellformedEmailAddressesAndPasswords() {
        let testEmail = "me@me.me"
        let testPassword = "password"

        let actual = isValid(email: testEmail, password: testPassword)

        XCTAssertTrue(actual)
    }
    
    func testItRejectsEmptyEmailAddresses() {
        let testEmail = ""
        let testPassword = "password"

        let actual = isValid(email: testEmail, password: testPassword)

        XCTAssertFalse(actual)
    }
    
    func testItRejectsEmptyPasswords() {
        let testEmail = "me@me.me"
        let testPassword = ""

        let actual = isValid(email: testEmail, password: testPassword)

        XCTAssertFalse(actual)
    }

    
    func testItRejectsPoorlyFormedEmailAddresses() {
        let testEmail = "me me me"
        let testPassword = "password"

        let actual = isValid(email: testEmail, password: testPassword)

        XCTAssertFalse(actual)
    }
    
    func testItRejectsPasswordsShorterThan8Characters() {
        let testEmail = "me@me.me"
        let testPassword = "pass"

        let actual = isValid(email: testEmail, password: testPassword)

        XCTAssertFalse(actual)
    }
}
