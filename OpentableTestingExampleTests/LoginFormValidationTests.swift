import XCTest
@testable import OpentableTestingExample

class LoginFormValidationTests: XCTestCase {
    
    func testItAcceptsWellformedEmailAddressesAndPasswords() {
        XCTAssert(validate(email: "someexample@example.com",
                           password: "password"))
        XCTAssert(validate(email: "someexample@example.com",
                           password: "another password"))
        XCTAssert(validate(email: "anotheremail@example.com",
                           password: "password"))
    }
    
    func testItRejectsEmptyEmailAddresses() {
        XCTAssertFalse(validate(email: "",
                                password: "password"))
    }
    
    func testItRejectsEmptyPasswords() {
        XCTAssertFalse(validate(email: "someemail@example.com",
                                password: ""))
    }

    
    func testItRejectsPoorlyFormedEmailAddresses() {
        XCTAssertFalse(validate(email: "someemailexample.com",
                                password: "password"))
        XCTAssertFalse(validate(email: "someemail@examplecom",
                                password: "password"))
        XCTAssertFalse(validate(email: "some email@examplecom",
                                password: "password"))
    }
    
    func testItRejectsPasswordsShorterThan8Characters() {
        XCTAssertFalse(validate(email: "someemail@example.com",
                                password: "pass"))
        XCTAssertFalse(validate(email: "someemail@example.com",
                                password: "some_#!"))
    }
}
