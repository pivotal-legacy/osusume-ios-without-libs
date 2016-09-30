import Foundation
import UIKit

class RestaurantListViewController: UIViewController {

    // MARK: - Properties
    var titleLabel = AutoLayoutLabel()
    var logoutButton = UIBarButtonItem()
    var addRestaurantButton = UIBarButtonItem()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupButtons()
        self.setupLabels()
        self.addSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let views: [String:UIView] = [
            "titleLabel": self.titleLabel,
        ]
        
        //Vertical
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|"
                    + "-(topLayoutGuide)"
                    + "-[titleLabel]",
                options: [],
                metrics: ["topLayoutGuide": self.topLayoutGuide.length],
                views: views
            )
        )
        
        //Horizontal
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[titleLabel]-|",
                options: [],
                metrics: nil,
                views: views
            )
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard TokenManager.hasToken() else {
            
            let loginViewController = LoginViewController()
            
            self.present(
                loginViewController,
                animated: true,
                completion: nil
            )

            return
        }
    }

    // MARK: - View Config
    private func setupButtons() {
        self.logoutButton = UIBarButtonItem(
            title: "Logout",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(self.logout)
        )

        self.navigationItem.leftBarButtonItem = self.logoutButton

        self.addRestaurantButton = UIBarButtonItem(
            title: "Add Restaurant",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(self.showAddRestaurantScreen)
        )

        self.navigationItem.rightBarButtonItem = self.addRestaurantButton

    }

    private func setupLabels() {
        self.titleLabel.text = "Restaurants"
    }
    
    private func addSubviews() {
        self.view.addSubview(self.titleLabel)
    }

    // MARK: - Actions
    func logout() {
        TokenManager.deleteToken()

        let loginViewController = LoginViewController()

        self.navigationController?.present(
            loginViewController,
            animated: true,
            completion: nil
        )
    }

    func showAddRestaurantScreen() {
        let addRestaurantViewController = AddRestaurantViewController()

        self.navigationController?.pushViewController(
            addRestaurantViewController,
            animated: true
        )
    }
}
