// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mobilePlan = try MobilePlan(json)

import Foundation

// MARK: - MobilePlan
public struct MobilePlan: Codable, Sendable {
  public let data: String
  public let type: String
  public let expires: String

  enum CodingKeys: String, CodingKey {
    case data = "Datos"
    case type = "tipo"
    case expires = "Vence"
  }

  public init(data: String, type: String, expires: String) {
    self.data = data
    self.type = type
    self.expires = expires
  }
}

// MARK: MobilePlan convenience initializers and mutators

extension MobilePlan {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MobilePlan.self, from: data)
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
    type: String? = nil,
    expires: String? = nil
  ) -> MobilePlan {
    return MobilePlan(
      data: data ?? self.data,
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
