import Foundation

class NetworkOsusumeSession: OsusumeSession {
    
    func dataTask(urlRequest: URLRequest, sessionCompletionHandler: @escaping (_ error: Error?, _ data: Data?) -> Void) {

        let session = URLSession(configuration: URLSessionConfiguration.default)

        session.dataTask(
            with: urlRequest,
            completionHandler: {
                (data: Data?, response: URLResponse?, error: Error?) in

                if let httpResponse = response as? HTTPURLResponse {

                    switch httpResponse.statusCode {
                    case 200:
                        sessionCompletionHandler(error, data)
                    default:
                        let httpStatusError = NSError(
                            domain: "NetworkOsusumeSession_dataTask",
                            code: ErrorCode.HttpStatusCodeError.rawValue,
                            userInfo: nil
                        )
                        
                        sessionCompletionHandler(httpStatusError, data)
                    }
                }
            }
        ).resume()
    }
}
