import XCTest

@testable import osusume

class OsusumeApiStoreTests: XCTestCase {
    var store: OsusumeApiStore!
    
    override func setUp() {
        super.setUp()
        
        self.store = OsusumeApiStore()
    }
    
    func test_loginSuccessReturnsToken() {
        
        let dataString = "testToken"
        self.store.session = MockOsusumeSession.success(dataString: dataString)
        
        self.store.login(
            name: "danny",
            password: "secret",
            closure: {
                (error: NSError?, token: String?) in
                
                XCTAssertNil(error)
                XCTAssertGreaterThan(token!.characters.count, 0)
                XCTAssertEqual(token, dataString)
            }
        )
    }

    func test_loginFailureReturnsError() {
        self.store.session = MockOsusumeSession.failure()
        
        self.store.login(
            name: "danny",
            password: "secret",
            closure: {
                (error: NSError?, token: String?) in
                
                XCTAssertNotNil(error)
                XCTAssertNil(token)
            }
        )
    }
}
