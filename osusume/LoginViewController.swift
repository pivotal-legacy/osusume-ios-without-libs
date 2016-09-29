import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    var nameTextField = AutoLayoutTextField()
    var passwordTextField = AutoLayoutTextField()
    var loginButton = AutoLayoutButton(type: UIButtonType.system)
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.backgroundColor = UIColor.yellow
        self.passwordTextField.backgroundColor = UIColor.green
        
        self.setupTextFields()
        self.setupButton()
        self.addSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        let views: [String:UIView] = [
            "nameTextField": self.nameTextField,
            "passwordTextField": self.passwordTextField,
            "loginButton": self.loginButton,
        ]
        
        // Vertical
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|"
                                    + "-(topLayoutGuide)"
                                    + "-[nameTextField]"
                                    + "-[passwordTextField]"
                                    + "-[loginButton]",
                options: [],
                metrics: ["topLayoutGuide": self.topLayoutGuide.length],
                views: views
            )
        )
        
        // Horizontal
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[nameTextField]-|",
                options: [],
                metrics: nil,
                views: views
            )
        )
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[passwordTextField]-|",
                options: [],
                metrics: nil,
                views: views
            )
        )
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[loginButton]-|",
                options: [],
                metrics: nil,
                views: views
            )
        )
    }
    
    // MARK: - View Config
    private func setupTextFields() {
        self.nameTextField.placeholder = "Name"
        self.passwordTextField.placeholder = "Password"
    }
    
    private func setupButton() {
        self.loginButton.setTitle("Login", for: UIControlState.normal)
        self.loginButton.backgroundColor = UIColor.red
        self.loginButton.addTarget(
            self,
            action: #selector(self.login),
            for: UIControlEvents.touchUpInside
        )
    }
    
    private func addSubviews() {
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.loginButton)
    }
    
    func login() {
        OsusumeApiStore().login(
            name: self.nameTextField.text!,
            password: self.passwordTextField.text!,
            closure: {
                (error: NSError?, token: String?) in

                if error == nil && token != nil {
                    TokenManager.setToken(token: token!)
                    self.dismiss(animated: true, completion: nil)
                }
        })
    }
}
