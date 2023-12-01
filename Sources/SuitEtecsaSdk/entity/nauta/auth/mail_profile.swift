// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mailProfile = try MailProfile(json)

import Foundation

// MARK: - MailProfile
public struct MailProfile: Codable, Sendable {
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

  public init(emailAccount: String, saleDate: String, id: String, currency: String) {
    self.emailAccount = emailAccount
    self.saleDate = saleDate
    self.id = id
    self.currency = currency
  }
}

// MARK: MailProfile convenience initializers and mutators

extension MailProfile {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MailProfile.self, from: data)
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
    emailAccount: String? = nil,
    saleDate: String? = nil,
    id: String? = nil,
    currency: String? = nil
  ) -> MailProfile {
    return MailProfile(
      emailAccount: emailAccount ?? self.emailAccount,
      saleDate: saleDate ?? self.saleDate,
      id: id ?? self.id,
      currency: currency ?? self.currency
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
