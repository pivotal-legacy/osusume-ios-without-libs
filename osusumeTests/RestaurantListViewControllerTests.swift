import XCTest

@testable import osusume

class RestaurantListViewControllerTests: XCTestCase {

    var appDelegate: AppDelegate!
    var navigationController: UINavigationController!
    var restaurantListViewController: RestaurantListViewController!

    override func setUp() {
        super.setUp()

        self.appDelegate = UIApplication.shared.delegate as! AppDelegate

        self.navigationController = self.appDelegate.window!.rootViewController as! UINavigationController
        self.restaurantListViewController = self.navigationController.viewControllers[0] as! RestaurantListViewController
        self.restaurantListViewController.view.setNeedsLayout()
    }
    
    func test_showsLogoutButton() {
        XCTAssertEqual(self.restaurantListViewController.navigationItem.leftBarButtonItem?.title, "Logout")
    }

    func test_tappingLogoutButton_deletesToken() {
        TokenManager.setToken(token: "testToken")

        UIApplication.shared.sendAction(
            self.restaurantListViewController.logoutButton.action!,
            to: self.restaurantListViewController.logoutButton.target,
            from: self,
            for: nil
        )

        XCTAssertFalse(TokenManager.hasToken())
    }

    func test_tappingLogoutButton_showsLoginScreen() {
        TokenManager.setToken(token: "testToken")

        UIApplication.shared.sendAction(
            self.restaurantListViewController.logoutButton.action!,
            to: self.restaurantListViewController.logoutButton.target,
            from: self,
            for: nil
        )

        XCTAssertTrue(self.restaurantListViewController.presentedViewController is LoginViewController)
    }

    func test_showsAddRestaurantButton() {
        XCTAssertEqual(self.restaurantListViewController.navigationItem.rightBarButtonItem?.title, "Add Restaurant")
    }

    func test_tappingAddRestaurantButton_showsAddRestaurantScreen() {
        UIApplication.shared.sendAction(
            self.restaurantListViewController.addRestaurantButton.action!,
            to: self.restaurantListViewController.addRestaurantButton.target,
            from: self,
            for: nil
        )

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            XCTAssertTrue(self.navigationController.viewControllers.last is AddRestaurantViewController)
        })
    }
}
