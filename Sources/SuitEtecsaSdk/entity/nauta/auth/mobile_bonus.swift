// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mobileBonus = try MobileBonus(json)

import Foundation

// MARK: - MobileBonus
public struct MobileBonus: Codable, Sendable {
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

  public init(data: String, startDate: String, type: String, expires: String) {
    self.data = data
    self.startDate = startDate
    self.type = type
    self.expires = expires
  }
}

// MARK: MobileBonus convenience initializers and mutators

extension MobileBonus {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MobileBonus.self, from: data)
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
    data: String? = nil,
    startDate: String? = nil,
    type: String? = nil,
    expires: String? = nil
  ) -> MobileBonus {
    return MobileBonus(
      data: data ?? self.data,
      startDate: startDate ?? self.startDate,
      type: type ?? self.type,
      expires: expires ?? self.expires
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
