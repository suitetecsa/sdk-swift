import Foundation

public struct MailService: Sendable {
    public let operations: [Operation]
    public let profile: MailProfile
    public let productType: String
}
