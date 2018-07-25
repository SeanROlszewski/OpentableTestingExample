import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        emailTextField.accessibilityIdentifier = "EmailField"
        passwordTextField.accessibilityIdentifier = "PasswordField"
        submitButton.accessibilityIdentifier = "SubmitButton"
        
    }
}
