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
        UserDefaults.standard.set("testToken", forKey: "token")

        UIApplication.shared.sendAction(
            self.restaurantListViewController.logoutButton.action!,
            to: self.restaurantListViewController.logoutButton.target,
            from: self,
            for: nil
        )

        XCTAssertNil(UserDefaults.standard.value(forKey: "token"))
    }

    func test_tappingLogoutButton_showsLoginScreen() {
        UserDefaults.standard.set("testToken", forKey: "token")

        UIApplication.shared.sendAction(
            self.restaurantListViewController.logoutButton.action!,
            to: self.restaurantListViewController.logoutButton.target,
            from: self,
            for: nil
        )

        XCTAssertTrue(self.restaurantListViewController.presentedViewController is LoginViewController)
    }

}
