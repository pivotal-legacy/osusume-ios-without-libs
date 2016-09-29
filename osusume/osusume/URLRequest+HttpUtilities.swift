import Foundation

extension URLRequest {

    static func postJsonRequest(url: URL, jsonDictionary: NSDictionary) -> URLRequest? {

        var urlRequest: URLRequest?

        urlRequest = URLRequest(url: url)
        urlRequest!.httpMethod = "post"
        urlRequest!.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            urlRequest!.httpBody = try JSONSerialization.data(
                withJSONObject: jsonDictionary,
                options: []
            )
        }
        catch {
            urlRequest = nil
        }

        return urlRequest
    }
}
