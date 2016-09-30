import XCTest

@testable import osusume

class URLRequest_HttpUtilitiesTests: XCTestCase {
    
    func test_postJsonRequestCreatesURLRequest() {

        let url = URL(string: "http://test.example.com")

        let jsonDictionary = [
            "name": "Michael Jackson",
            "password": "Thriller",
        ]

        let urlRequest = URLRequest.postJsonRequest(url: url!, jsonDictionary: jsonDictionary as NSDictionary)
        let expectedJsonString = "{\"name\":\"Michael Jackson\",\"password\":\"Thriller\"}"

        XCTAssertEqual(urlRequest!.httpMethod, "POST")
        XCTAssertEqual(urlRequest!.url, url)
        XCTAssertEqual(urlRequest!.allHTTPHeaderFields!["Content-Type"], "application/json")
        XCTAssertEqual(urlRequest!.httpBody!, expectedJsonString.data(using: String.Encoding.utf8))
    }
}
