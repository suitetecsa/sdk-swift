import Foundation

public struct ComplementaryService: Codable {
  public let service: String
  public let value: String

  enum CodingKeys: String, CodingKey {
    case service = "Servicio"
    case value = "Valor"
  }
}
