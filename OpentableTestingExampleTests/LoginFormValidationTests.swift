import XCTest
@testable import OpentableTestingExample

class LoginFormValidationTests: XCTestCase {
    
    func testItAcceptsWellformedEmailAddressesAndPasswords() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItRejectsEmptyEmailAddresses() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItRejectsEmptyPasswords() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }

    
    func testItRejectsPoorlyFormedEmailAddresses() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItRejectsPasswordsShorterThan8Characters() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
}
