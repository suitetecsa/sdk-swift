import Foundation

public struct MailProfile: Codable {
  public let emailAccount: String
  public let saleDate: String
  public let id: String
  public let currency: String

  enum CodingKeys: String, CodingKey {
    case emailAccount = "Cuenta de correo"
    case saleDate = "Fecha de venta"
    case id = "id"
    case currency = "Moneda"
  }
}
