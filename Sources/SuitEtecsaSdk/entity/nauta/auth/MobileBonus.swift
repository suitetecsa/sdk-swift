import Foundation

public struct MobileBonus: Codable {
  public let data: String
  public let startDate: String
  public let type: String
  public let expires: String

  enum CodingKeys: String, CodingKey {
    case data = "Datos"
    case startDate = "Fecha inicio"
    case type = "tipo"
    case expires = "Vence"
  }
}
