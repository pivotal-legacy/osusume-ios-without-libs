import Foundation
import XCTest

extension XCTestCase {

    func tapAndWaitForExpectedElementToBeVisible(expectedElement: XCUIElement, tappableElement: XCUIElement) {

        let predicate = NSPredicate(format: "exists == true", argumentArray: nil)

        self.expectation(for: predicate, evaluatedWith: expectedElement, handler: nil)

        tappableElement.tap()

        self.waitForExpectations(timeout: 5, handler: nil)
    }
}
