import XCTest
@testable import OpentableTestingExample

class LoginViewControllerTests: XCTestCase {
    var loginViewController: LoginViewController! // This is a trick that make sure we create a login view controller for testing
                                                  // Should we forget to do so, our tests will crash because we haven't created an instance of the test subject, reminding us to make sure we create the thing we're testing!
    
    override func setUp() {
        
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as! UINavigationController // Our navigation is handled by a navigation controller
        loginViewController = navigationController.viewControllers.first! as! LoginViewController // The test subject is the first view controller (LoginViewController) inside of our navigation hierarchy

        _ = loginViewController.view // This is a trick that makes sure all of the views inside of our view controller are rendered.
                                     // Without this, attempting to access our text fields and button will
                                     // cause a crash because they haven't been loaded yet.
                                     // This trick works because views get loaded the first time they referenced (they're lazy loaded)
    }
    
    func testItLogsInWhenTheUserPressesSubmit() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItDisablesTheLoginButtonWithEmptyFields() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItDisablesTheLoginButtonWithAnEmptyPasswordField() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItDisablesTheLoginButtonWithAnEmptyEmailField() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
    
    func testItEnablesTheLoginButtonWithACompleteEmailAndPassword() {
        XCTFail("Write the test you think should go here, then make it pass.")
    }
}
