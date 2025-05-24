import Foundation

public struct FixedTelephonyProfile: Sendable {
    public let id, phoneNumber: String
    public let supplementaryServices: [ComplementaryService]
}
