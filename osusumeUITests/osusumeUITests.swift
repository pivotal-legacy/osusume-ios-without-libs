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
    
    func test_addInfoScreenShowsWhenLoginIsSuccessful() {
        XCUIApplication().textFields["Name"].tap()
        XCUIApplication().textFields["Name"].typeText("danny")
        
        XCUIApplication().textFields["Password"].tap()
        XCUIApplication().textFields["Password"].typeText("password")

        let restaurantListPredicate = NSPredicate(format: "exists == true", argumentArray: nil)

        let restaurantListText = XCUIApplication().staticTexts["Restaurants"]

        expectation(for: restaurantListPredicate, evaluatedWith: restaurantListText, handler: nil)

        XCUIApplication().buttons["Login"].tap()

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(restaurantListText.exists)
    }
}
