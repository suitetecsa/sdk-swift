import Foundation

public struct MobileService: Sendable, Codable {
    public let profile: MobileProfile

    enum CodingKeys: String, CodingKey {
        case profile = "perfil"
    }
}
