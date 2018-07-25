import XCTest

class OpentableTestingExampleUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        /*
         continueAfterFailure is a setting that lets a test suite stop after the first failure.
         This is valuable because tests can sometimes take a long time (UI tests are notorious for this) before they finish.
         Additionally, a particular test failure might mean a later test is bound to fail,
         and if we can prevent this cascading failure, we have a better experience testing.
         */
        continueAfterFailure = false
        
        app = XCUIApplication() // XCUIApplication is a class that represents the application your building
                                // It's the way you interact with your app to validate it's working
        
        app.launch() // UI tests begin when you launch your application
    }
    
    func testAUserCanLogIntoTheApp() {
        app.textFields["EmailField"].tap()
        app.textFields["EmailField"].typeText("this-is-my-email-address@gmail.com")
        
        app.secureTextFields["PasswordField"].tap()
        app.secureTextFields["PasswordField"].typeText("this-is-my-supersecret-password")
        
        app.buttons["SubmitButton"].tap()
        
        XCTAssert(app.staticTexts["Illegal Seafoods"].exists)
    }
    
}
