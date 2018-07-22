import UIKit

func validate(email: String, password: String) -> Bool {
    return email.contains("@") &&
        email.contains(".") &&
        !email.contains(" ") &&
        password.count >= 8
}

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.accessibilityIdentifier = "EmailField"
        passwordTextField.accessibilityIdentifier = "PasswordField"
        submitButton.accessibilityIdentifier = "SubmitButton"
        emailTextField.addTarget(self,
                                 action: #selector(textFieldChanged),
                                 for: .editingChanged)
        passwordTextField.addTarget(self,
                                    action: #selector(textFieldChanged),
                                    for: .editingChanged)
    }
}

private extension LoginViewController {
    @objc func textFieldChanged() {
        guard let username = emailTextField.text,
            let password = passwordTextField.text else {
                return
        }
        
        submitButton.isEnabled = validate(email: username,
                                          password: password)
    }
}

