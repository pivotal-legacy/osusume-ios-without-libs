import Foundation

class TokenManager {

    private static var tokenKey = "token"

    class func deleteToken() {
        if UserDefaults.standard.value(forKey: TokenManager.tokenKey) != nil {
            UserDefaults.standard.removeObject(forKey: TokenManager.tokenKey)
        }
    }

    class func setToken(token: String) {
        UserDefaults.standard.set(token, forKey: TokenManager.tokenKey)
    }

    class func hasToken() -> Bool {
        return UserDefaults.standard.string(forKey: TokenManager.tokenKey) != nil
    }
}
