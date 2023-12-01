// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mailService = try MailService(json)

import Foundation

// MARK: - MailService
public struct MailService: Codable, Sendable {
  public let operations: [String: Operation]
  public let profile: MailProfile
  public let productType: String

  enum CodingKeys: String, CodingKey {
    case operations = "operaciones"
    case profile = "perfil"
    case productType = "tipoProducto"
  }

  public init(operations: [String: Operation], profile: MailProfile, productType: String) {
    self.operations = operations
    self.profile = profile
    self.productType = productType
  }
}

// MARK: MailService convenience initializers and mutators

extension MailService {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MailService.self, from: data)
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
    operations: [String: Operation]? = nil,
    profile: MailProfile? = nil,
    productType: String? = nil
  ) -> MailService {
    return MailService(
      operations: operations ?? self.operations,
      profile: profile ?? self.profile,
      productType: productType ?? self.productType
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
