// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let navProfile = try NavProfile(json)

import Foundation

// MARK: - NavProfile
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

  public init(
    bonusToEnjoy: String, accessAccount: String, status: String, lockDate: String,
    deletionDate: String, saleDate: String, bonusHours: String, id: String, currency: String,
    balance: String, accessType: String
  ) {
    self.bonusToEnjoy = bonusToEnjoy
    self.accessAccount = accessAccount
    self.status = status
    self.lockDate = lockDate
    self.deletionDate = deletionDate
    self.saleDate = saleDate
    self.bonusHours = bonusHours
    self.id = id
    self.currency = currency
    self.balance = balance
    self.accessType = accessType
  }
}

// MARK: NavProfile convenience initializers and mutators

extension NavProfile {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(NavProfile.self, from: data)
  }

  public init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  public init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  public func with(
    bonusToEnjoy: String? = nil,
    accessAccount: String? = nil,
    status: String? = nil,
    lockDate: String? = nil,
    deletionDate: String? = nil,
    saleDate: String? = nil,
    bonusHours: String? = nil,
    id: String? = nil,
    currency: String? = nil,
    balance: String? = nil,
    accessType: String? = nil
  ) -> NavProfile {
    return NavProfile(
      bonusToEnjoy: bonusToEnjoy ?? self.bonusToEnjoy,
      accessAccount: accessAccount ?? self.accessAccount,
      status: status ?? self.status,
      lockDate: lockDate ?? self.lockDate,
      deletionDate: deletionDate ?? self.deletionDate,
      saleDate: saleDate ?? self.saleDate,
      bonusHours: bonusHours ?? self.bonusHours,
      id: id ?? self.id,
      currency: currency ?? self.currency,
      balance: balance ?? self.balance,
      accessType: accessType ?? self.accessType
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
