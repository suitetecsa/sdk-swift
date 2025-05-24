import Foundation

public struct CaptchaResponse: Codable, Sendable {
    public let idRequest: String
    public let content: String

    enum CodingKeys: String, CodingKey {
        case idRequest = "text"
        case content = "data"
    }
}
