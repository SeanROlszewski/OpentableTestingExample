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
    
    lazy var networkClient: NetworkClient = HttpClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        emailTextField.accessibilityIdentifier = "EmailField"
        passwordTextField.accessibilityIdentifier = "PasswordField"
        submitButton.accessibilityIdentifier = "SubmitButton"
        
        emailTextField.addTarget(self,
                                 action: #selector(textFieldChanged),
                                 for: .editingChanged)
        
        passwordTextField.addTarget(self,
                                    action: #selector(textFieldChanged),
                                    for: .editingChanged)
        
        submitButton.addTarget(self,
                               action: #selector(submitButtonPressed),
                               for: .touchUpInside)
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
    
    @objc func submitButtonPressed() {
        let email = emailTextField.text! // It's safe to force unwrap these values because we know they can't be nil here
        let password = passwordTextField.text!
        
        networkClient.login(using: email,
                            password: password) { (statusCode) in
            print("network call completed with \(statusCode) status code")
        }
    }
}

