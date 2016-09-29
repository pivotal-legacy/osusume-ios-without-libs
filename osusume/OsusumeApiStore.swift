import Foundation
import UIKit


class OsusumeApiStore {

    var baseURL = ProcessInfo.processInfo.environment["BASE_URL"]!

    var session: OsusumeSession
    
    init() {
        self.session = NetworkOsusumeSession()
    }
    
    func login(
        name:String,
        password: String,
        closure: @escaping ( (_ error: NSError?, _ token: String?) -> Void) ) {

            let loginCredentials = [
                "name": name,
                "password": password,
            ]

            guard
                let urlRequest = URLRequest.postJsonRequest(
                    url: URL(string: self.baseURL + "/login")!,
                    jsonDictionary: loginCredentials as NSDictionary
                )
            else {
                let localError = NSError(
                    domain: "OsusumeApiStore_login",
                    code: ErrorCode.JsonDataError.rawValue, 
                    userInfo: nil
                )

                closure(localError, nil)

                return
            }

            self.session.dataTask(
                urlRequest: urlRequest,
                sessionCompletionHandler: {
                    (error, data) in
                    
                    if error != nil || data == nil  {
                        
                        let localError = NSError(
                            domain: "OsusumeApiStore_login",
                            code: ErrorCode.NetworkError.rawValue,
                            userInfo: nil
                        )

                        closure(localError, nil)
                    }
                    else {

                        let string = String(data: data!, encoding: String.Encoding.utf8)

                        closure(nil, string)
                    }
                }
            )
    }
}
