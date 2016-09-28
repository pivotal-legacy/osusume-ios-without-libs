import XCTest

@testable import osusume
class osusumeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    
        XCUIApplication().launch()
    }
    
    func test_loginScreenViewElementsAreHittable() {
        XCTAssertTrue(XCUIApplication().textFields["Name"].isHittable)
        XCTAssertTrue(XCUIApplication().textFields["Password"].isHittable)
        XCTAssertTrue(XCUIApplication().buttons["Login"].isHittable)
    }
}
