import Foundation

public struct NavProfile: Codable, Sendable {
  public let bonusToEnjoy: String
  public let accessAccount: String
  public let status: String
  public let lockDate: String
  public let deletionDate: String
  public let saleDate: String
  public let bonusHours: String
  public let id: String
  public let currency: String
  public let balance: String
  public let accessType: String

  enum CodingKeys: String, CodingKey {
    case bonusToEnjoy = "Bonificación por disfrutar"
    case accessAccount = "Cuenta de acceso"
    case status = "Estado"
    case lockDate = "Fecha de bloqueo"
    case deletionDate = "Fecha de eliminación"
    case saleDate = "Fecha de venta"
    case bonusHours = "Horas de bonificación"
    case id = "id"
    case currency = "Moneda"
    case balance = "saldo"
    case accessType = "Tipo de acceso"
  }
}
