import Foundation

class NetworkOsusumeSession: OsusumeSession {
    
    func dataTask(urlRequest: URLRequest, sessionCompletionHandler: @escaping (_ error: Error?, _ data: Data?) -> Void) {

        let session = URLSession(configuration: URLSessionConfiguration.default)

        session.dataTask(
            with: urlRequest,
            completionHandler: {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                sessionCompletionHandler(error, data)
            }
        ).resume()
    }
}
