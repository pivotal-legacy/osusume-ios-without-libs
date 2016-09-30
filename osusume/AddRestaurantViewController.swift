import Foundation
import UIKit

class AddRestaurantViewController: UIViewController {

    var titleLabel = AutoLayoutLabel()
    var restaurantNameTextField = AutoLayoutTextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViewElements()
        self.addSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let views: [String:UIView] = [
            "titleLabel": self.titleLabel,
            "restaurantNameTextField": self.restaurantNameTextField,
        ]

        //Vertical
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|"
                    + "-(topLayoutGuide)"
                    + "-[titleLabel]"
                    + "-[restaurantNameTextField]",
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
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[restaurantNameTextField]-|",
                options: [],
                metrics: nil,
                views: views
            )
        )
    }

    func setupViewElements() {
        self.titleLabel.text = "Add Restaurant Info"

        self.restaurantNameTextField.placeholder = "Restaurant Name"
        self.restaurantNameTextField.accessibilityIdentifier = "RestaurantNameTextField"
    }

    func addSubviews() {
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.restaurantNameTextField)
    }
}
