import XCTest

@testable import osusume

class AddRestaurantViewControllerTests: XCTestCase {
    var addRestaurantViewController = AddRestaurantViewController()

    override func setUp() {
        super.setUp()

        self.addRestaurantViewController.view.setNeedsLayout()
    }
    
    func test_addInfoLabel_displaysCorrectTitle() {
        XCTAssertEqual(self.addRestaurantViewController.titleLabel.text, "Add Restaurant Info")
    }
    
}
