import XCTest

@testable import osusume

class AddRestaurantViewControllerTests: XCTestCase {
    var addRestaurantViewController = AddRestaurantViewController()

    override func setUp() {
        super.setUp()

        self.addRestaurantViewController.view.setNeedsLayout()
    }
    
    func test_titleLabel_displaysCorrectTitle() {
        XCTAssertEqual(self.addRestaurantViewController.titleLabel.text, "Add Restaurant Info")
    }

    func test_canAddRestaurantName() {

        let restaurantName = "Pizzakaya"

        self.addRestaurantViewController.restaurantNameTextField.text = restaurantName

        XCTAssertEqual(self.addRestaurantViewController.restaurantNameTextField.text, restaurantName)
    }
    
}
