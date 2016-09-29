import Foundation

public protocol OsusumeSession {
    func dataTask(urlRequest: URLRequest, sessionCompletionHandler: @escaping (_ error: Error?, _ data: Data?) -> Void)
}
