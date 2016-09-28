import Foundation
import UIKit


class OsusumeApiStore {
    
    let baseURL = "http://localhost:3000"
    var session: OsusumeSession
    
    init() {
        self.session = NetworkOsusumeSession()
    }
    
    func login(
        name:String,
        password: String,
        closure: @escaping ( (_ error: NSError?, _ token: String?) -> Void) ) {
        
        
            self.session.dataTask(
                urlRequest: URLRequest(url: URL(string: self.baseURL + "/login")!),
                sessionCompletionHandler: {
                    (error, data) in
                    
                    if error != nil || data == nil  {
                        
                        let localError = NSError(domain: "OsusumeApiStore_login", code: ErrorCode.NetworkError.rawValue, userInfo: nil)
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
