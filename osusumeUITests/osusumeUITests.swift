import XCTest

@testable import osusume
class osusumeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    
        let application = XCUIApplication()
        application.launchArguments = ["isTesting"]
        application.launchEnvironment = ProcessInfo().environment
        application.launch()
    }
    
    func test_restaurantCreationSuccessful() {
        XCUIApplication().textFields["Name"].tap()
        XCUIApplication().textFields["Name"].typeText("danny")
        
        XCUIApplication().textFields["Password"].tap()
        XCUIApplication().textFields["Password"].typeText("password")

        let restaurantListText = XCUIApplication().staticTexts["Restaurants"]
        let loginButton = XCUIApplication().buttons["Login"]

        self.tapAndWaitForExpectedElementToBeVisible(expectedElement: restaurantListText, tappableElement: loginButton)

        XCTAssertTrue(restaurantListText.exists)

        let addRestaurantScreenText = XCUIApplication().staticTexts["Add Restaurant Info"]
        let addRestaurantButton = XCUIApplication().buttons["Add Restaurant"]

        self.tapAndWaitForExpectedElementToBeVisible(expectedElement: addRestaurantScreenText, tappableElement: addRestaurantButton)

        XCTAssertTrue(addRestaurantScreenText.exists)
        XCTAssertTrue(XCUIApplication().textFields["RestaurantNameTextField"].isHittable)
    }
}
