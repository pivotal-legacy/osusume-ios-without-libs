import Foundation

@testable import osusume

class MockOsusumeSession: OsusumeSession {
    
    var data: NSData?
    var error: NSError?
    
    func dataTask(urlRequest: URLRequest, sessionCompletionHandler: @escaping (_ error: Error?, _ data: Data?)-> Void)  {
        
        if self.error != nil {
            sessionCompletionHandler(self.error!, nil)
        } else {
            sessionCompletionHandler(nil, data! as Data)
        }
    }
    
    class func success(dataString: String) -> MockOsusumeSession {
        let session = MockOsusumeSession()
        session.data = dataString.data(using: String.Encoding.utf8) as NSData?
        return session
    }

    class func failure() -> MockOsusumeSession {
        let session = MockOsusumeSession()
        session.error = NSError(domain: "MockOsusumeSession_failure", code: ErrorCode.NetworkError.rawValue, userInfo: nil)
        return session
    }
    
    
}
