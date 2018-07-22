import XCTest
@testable import OpentableTestingExample

class NetworkClientSpy: NetworkClient {

    private(set) var methodCalls: [String] = []
    private(set) var loginArguments: (email: String, password: String)?
    
    func login(using email: String, password: String, completionHandler: @escaping (Int) -> Void) {
        methodCalls.append(#function)
        loginArguments = (email: email,
                          password: password)
    }
}

class LoginViewControllerTests: XCTestCase {
    var networkClientSpy: NetworkClientSpy!
    var loginViewController: LoginViewController! // This is a trick that make sure we create a login view controller for testing
                                                  // Should we forget to do so, our tests will crash because we haven't created an instance of the test subject, reminding us to make sure we create the thing we're testing!
    
    override func setUp() {
        
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as! UINavigationController // Our navigation is handled by a navigation controller
        loginViewController = navigationController.viewControllers.first! as! LoginViewController // The test subject is the first view controller (LoginViewController) inside of our navigation hierarchy
        
        networkClientSpy = NetworkClientSpy() // Create a test double for observing how our view controller collaborates with the network client
        loginViewController.networkClient = networkClientSpy // Inject our test double into our test subject
        
        _ = loginViewController.view // This is a trick that makes sure all of the views inside of our view controller are rendered.
                                     // Without this, attempting to access our text fields and button will
                                     // cause a crash because they haven't been loaded yet.
                                     // This trick works because views get loaded the first time they referenced (they're lazy loaded)
    }
    
    private func setTextFields(email: String, password: String)  {
        loginViewController.emailTextField.text = email
        loginViewController.emailTextField.sendActions(for: .editingChanged)
        
        loginViewController.passwordTextField.text = password
        loginViewController.passwordTextField.sendActions(for: .editingChanged)
    }
    
    func testItLogsInWhenTheUserPressesSubmit() {
        setTextFields(email: "someemail@example.com", password: "password")
        
        loginViewController.submitButton.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(networkClientSpy.methodCalls, ["login(using:password:completionHandler:)"])
        XCTAssertEqual(networkClientSpy.loginArguments?.email, "someemail@example.com")
        XCTAssertEqual(networkClientSpy.loginArguments?.password, "password")
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
