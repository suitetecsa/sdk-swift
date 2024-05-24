import Foundation

public struct MobilePlan: Codable {
  public let data: String
  public let type: String
  public let expires: String

  enum CodingKeys: String, CodingKey {
    case data = "Datos"
    case type = "tipo"
    case expires = "Vence"
  }
}
