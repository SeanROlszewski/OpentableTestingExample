import XCTest
@testable import OpentableTestingExample

class LoginViewControllerTests: XCTestCase {
    
    var loginViewController: LoginViewController! // This is a trick that make sure we create a login view controller for testing
                                                  // Should we forget to do so, our tests will crash because we haven't created an instance of the test subject, reminding us to make sure we create the thing we're testing!
    
    override func setUp() {
        loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as! LoginViewController
        _ = loginViewController.view // This is a trick that makes sure all of the views inside of our view controller are rendered.
                                     // Without this, attempting to access our text fields and button will
                                     // cause a crash because as they haven't been loaded yet.
                                     // This trick works because views get loaded the first time they referenced (they're lazy loaded)
    }
    
    private func setTextFields(email: String, password: String)  {
        loginViewController.emailTextField.text = email
        loginViewController.emailTextField.sendActions(for: .editingChanged)
        
        loginViewController.passwordTextField.text = password
        loginViewController.passwordTextField.sendActions(for: .editingChanged)
    }
    
    func testItDisablesTheLoginButtonWithEmptyFields() {
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
        
        setTextFields(email: "", password: "")
        
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
    }
    
    func testItDisablesTheLoginButtonWithAnEmptyPasswordField() {
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
        
        setTextFields(email: "someemail@example.com", password: "")
        
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
    }
    
    func testItDisablesTheLoginButtonWithAnEmptyEmailField() {
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
        
        setTextFields(email: "", password: "password")
        
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
    }
    
    func testItEnablesTheLoginButtonWithACompleteEmailAndPassword() {
        XCTAssertFalse(loginViewController.submitButton.isEnabled)
        
        setTextFields(email: "someemail@example.com", password: "password")
        
        XCTAssert(loginViewController.submitButton.isEnabled)
    }
}
