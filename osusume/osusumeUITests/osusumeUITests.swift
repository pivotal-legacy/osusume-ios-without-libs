import XCTest

@testable import osusume
class osusumeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    
        let application = XCUIApplication()
        application.launchArguments = ["isTesting"]
        application.launch()    
    }
    
    func test_addInfoScreenShowsWhenLoginIsSuccessful() {
        XCUIApplication().textFields["Name"].tap()
        XCUIApplication().textFields["Name"].typeText("danny")
        
        XCUIApplication().textFields["Password"].tap()
        XCUIApplication().textFields["Password"].typeText("password")
        
        XCUIApplication().buttons["Login"].tap()
        
        XCTAssertTrue(XCUIApplication().staticTexts["Add Info"].exists)
    }
}
