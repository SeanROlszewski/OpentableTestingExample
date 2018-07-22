import XCTest

class OpentableTestingExampleUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAUserCanLogIntoTheApp() {
        app.textFields["EmailField"].tap()
        app.textFields["EmailField"].typeText("this-is-my-email-address@gmail.com")
        app.secureTextFields["PasswordField"].tap()
        app.secureTextFields["PasswordField"].typeText("this-is-my-supersecret-password")
        app.buttons["SubmitButton"].tap()
        
        XCTAssertFalse(app.staticTexts["Login 2 the app that tells alex to func himself"].exists)
    }
    
}
