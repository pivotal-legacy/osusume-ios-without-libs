import Foundation
import UIKit

class RestaurantListViewController: UIViewController {

    // MARK: - Properties
    var titleLabel = AutoLayoutLabel()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if UserDefaults.standard.string(forKey: "token") == nil {
            
            let loginViewController = LoginViewController()
            
            self.present(
                loginViewController,
                animated: true,
                completion: nil
            )
        }
    }
    
    // MARK: - View Config
    private func setupLabels() {
        self.titleLabel.text = "Restaurants"
    }
    
    private func addSubviews() {
        self.view.addSubview(self.titleLabel)
    }
}
