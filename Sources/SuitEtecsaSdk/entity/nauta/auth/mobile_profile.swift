// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mobileProfile = try MobileProfile(json)

import Foundation

// MARK: - MobileProfile
public struct MobileProfile: Codable, Sendable {
  public let Lte: String
  public let advanceBalance: String
  public let status: String
  public let lockDate: String
  public let deletionDate: String
  public let saleDate: String
  public let id: String
  public let internet: String
  public let lists: Listas
  public let currency: String
  public let phoneNumber: String
  public let mainBalance: String
  public let consumptionRate: String

  enum CodingKeys: String, CodingKey {
    case Lte = "4G"
    case advanceBalance = "Adelanta Saldo"
    case status = "Estado"
    case lockDate = "Fecha de Bloqueo"
    case deletionDate = "Fecha de Eliminación"
    case saleDate = "Fecha de Venta"
    case id = "id"
    case internet = "Internet"
    case lists = "Listas"
    case currency = "Moneda"
    case phoneNumber = "Número de Teléfono"
    case mainBalance = "Saldo Principal"
    case consumptionRate = "Tarifa por Consumo"
  }

  public init(
    Lte: String, advanceBalance: String, status: String, lockDate: String,
    deletionDate: String, saleDate: String, id: String, internet: String, lists: Listas,
    currency: String, phoneNumber: String, mainBalance: String, consumptionRate: String
  ) {
    self.Lte = Lte
    self.advanceBalance = advanceBalance
    self.status = status
    self.lockDate = lockDate
    self.deletionDate = deletionDate
    self.saleDate = saleDate
    self.id = id
    self.internet = internet
    self.lists = lists
    self.currency = currency
    self.phoneNumber = phoneNumber
    self.mainBalance = mainBalance
    self.consumptionRate = consumptionRate
  }
}

// MARK: MobileProfile convenience initializers and mutators

extension MobileProfile {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MobileProfile.self, from: data)
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
    Lte: String? = nil,
    advanceBalance: String? = nil,
    status: String? = nil,
    lockDate: String? = nil,
    deletionDate: String? = nil,
    saleDate: String? = nil,
    id: String? = nil,
    internet: String? = nil,
    lists: Listas? = nil,
    currency: String? = nil,
    phoneNumber: String? = nil,
    mainBalance: String? = nil,
    consumptionRate: String? = nil
  ) -> MobileProfile {
    return MobileProfile(
      Lte: Lte ?? self.Lte,
      advanceBalance: advanceBalance ?? self.advanceBalance,
      status: status ?? self.status,
      lockDate: lockDate ?? self.lockDate,
      deletionDate: deletionDate ?? self.deletionDate,
      saleDate: saleDate ?? self.saleDate,
      id: id ?? self.id,
      internet: internet ?? self.internet,
      lists: lists ?? self.lists,
      currency: currency ?? self.currency,
      phoneNumber: phoneNumber ?? self.phoneNumber,
      mainBalance: mainBalance ?? self.mainBalance,
      consumptionRate: consumptionRate ?? self.consumptionRate
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
