import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        emailTextField.accessibilityIdentifier = "EmailField"
        emailTextField.delegate = self
        passwordTextField.accessibilityIdentifier = "PasswordField"
        passwordTextField.delegate = self
        submitButton.accessibilityIdentifier = "SubmitButton"
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {

        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        submitButton.isEnabled = isValid(email: email, password: password)
    }
}

func isValid(email: String, password: String) -> Bool {
    return password != "" &&
        email != "" &&
        password.count >= 8 &&
        email.contains("@") &&
        email.contains(".") &&
        !email.contains(" ")
}
