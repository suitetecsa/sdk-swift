import Foundation

public struct User: Sendable {
    public let client: Client
    public let completed: Bool
    public let lastUpdate: String
    public let updatedServices: Bool
    public let mailServices: [MailService]
    public let navServices: [NavService]
    public let mobileServices: [MobileService]
    public let fixedTelephony: [FixedTelephony]
}
