// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let client = try Client(json)

import Foundation

// MARK: - Client
public struct Client: Codable, Sendable {
  public let email: String
  public let name: String
  public let mailNotifications: String
  public let mobileNotifications: String
  public let operations: [String: Operation]
  public let phoneNumber: String
  public let portalUser: String

  enum CodingKeys: String, CodingKey {
    case email = "email"
    case name = "nombre"
    case mailNotifications = "notificaciones_mail"
    case mobileNotifications = "notificaciones_movil"
    case operations = "operaciones"
    case phoneNumber = "telefono"
    case portalUser = "usuario_portal"
  }

  public init(
    email: String, name: String, mailNotifications: String, mobileNotifications: String,
    operations: [String: Operation], phoneNumber: String, portalUser: String
  ) {
    self.email = email
    self.name = name
    self.mailNotifications = mailNotifications
    self.mobileNotifications = mobileNotifications
    self.operations = operations
    self.phoneNumber = phoneNumber
    self.portalUser = portalUser
  }
}

// MARK: Client convenience initializers and mutators

extension Client {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(Client.self, from: data)
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
    email: String? = nil,
    name: String? = nil,
    mailNotifications: String? = nil,
    mobileNotifications: String? = nil,
    operations: [String: Operation]? = nil,
    phoneNumber: String? = nil,
    portalUser: String? = nil
  ) -> Client {
    return Client(
      email: email ?? self.email,
      name: name ?? self.name,
      mailNotifications: mailNotifications ?? self.mailNotifications,
      mobileNotifications: mobileNotifications ?? self.mobileNotifications,
      operations: operations ?? self.operations,
      phoneNumber: phoneNumber ?? self.phoneNumber,
      portalUser: portalUser ?? self.portalUser
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
