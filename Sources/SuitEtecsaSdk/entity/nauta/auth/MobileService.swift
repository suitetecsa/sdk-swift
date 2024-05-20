import Foundation

public struct MobileService: Codable {
  public let profile: MobileProfile

  enum CodingKeys: String, CodingKey {
    case profile = "perfil"
  }
}
