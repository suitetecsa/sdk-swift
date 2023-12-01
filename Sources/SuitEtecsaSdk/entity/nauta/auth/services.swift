// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let services = try Services(json)

import Foundation

// MARK: - Services
public struct Services: Codable, Sendable {
  public let mailServices: [String: MailService]?
  public let navServices: [String: NavService]?
  public let mobileServices: [String: MobileService]?
  public let fixedTelephony: [String: FixedTelephony]?

  enum CodingKeys: String, CodingKey {
    case mailServices = "Correo Nauta"
    case navServices = "Navegación"
    case mobileServices = "Servicios móviles"
    case fixedTelephony = "Telefonía fija"
  }

  public init(
    mailServices: [String: MailService]?, navServices: [String: NavService]?,
    mobileServices: [String: MobileService]?, fixedTelephony: [String: FixedTelephony]?
  ) {
    self.mailServices = mailServices
    self.navServices = navServices
    self.mobileServices = mobileServices
    self.fixedTelephony = fixedTelephony
  }
}

// MARK: Services convenience initializers and mutators

extension Services {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(Services.self, from: data)
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
    mailServices: [String: MailService]?? = nil,
    navServices: [String: NavService]?? = nil,
    mobileServices: [String: MobileService]?? = nil,
    fixedTelephony: [String: FixedTelephony]?? = nil
  ) -> Services {
    return Services(
      mailServices: mailServices ?? self.mailServices,
      navServices: navServices ?? self.navServices,
      mobileServices: mobileServices ?? self.mobileServices,
      fixedTelephony: fixedTelephony ?? self.fixedTelephony
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
