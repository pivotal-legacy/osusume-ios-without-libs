import Foundation
import UIKit

class AddRestaurantViewController: UIViewController {

    var titleLabel = AutoLayoutLabel()

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

    func setupLabels() {
        self.titleLabel.text = "Add Restaurant Info"
    }

    func addSubviews() {
        self.view.addSubview(self.titleLabel)
    }
}
