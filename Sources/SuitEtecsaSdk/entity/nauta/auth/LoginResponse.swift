import Foundation

public struct LoginResponse: Sendable {
    public let result, token: String
    public let user: User?
}
