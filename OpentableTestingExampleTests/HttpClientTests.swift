import XCTest
import Foundation
@testable import OpentableTestingExample

class HttpClientTests: XCTestCase {
    
    func testItLogsInUsingCredentials() {
        let loginExpectation = expectation(description: "logs the user in with a e-mail and password")
        
        let client = HttpClient()
        client.login(using: "someemail@example.com", password: "password") { (statusCode) in
            
            loginExpectation.fulfill()
            XCTAssertEqual(statusCode, 200)
            
        }
        
        wait(for: [loginExpectation], timeout: 5.0)
    }
    
    func testItDoesntLogsInUsingMalformedCredentials() {
        let loginExpectation = expectation(description: "fails to log the user in with an empty e-mail and password")
        
        let client = HttpClient()
        client.login(using: "", password: "") { (statusCode) in
            
            loginExpectation.fulfill()
            XCTAssertGreaterThanOrEqual(statusCode, 400)
            
        }
        
        wait(for: [loginExpectation], timeout: 5.0)
    }
}

