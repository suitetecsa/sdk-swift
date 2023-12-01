// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fixedTelephonyProfile = try FixedTelephonyProfile(json)

import Foundation

// MARK: - FixedTelephonyProfile
public struct FixedTelephonyProfile: Codable, Sendable {
  public let id: String
  public let lists: FixedTelephonyLists?
  public let phoneNumber: String

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case lists = "Listas"
    case phoneNumber = "Número de teléfono"
  }

  public init(id: String, lists: FixedTelephonyLists?, phoneNumber: String) {
    self.id = id
    self.lists = lists
    self.phoneNumber = phoneNumber
  }
}

// MARK: FixedTelephonyProfile convenience initializers and mutators

extension FixedTelephonyProfile {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(FixedTelephonyProfile.self, from: data)
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
    id: String? = nil,
    lists: FixedTelephonyLists?? = nil,
    phoneNumber: String? = nil
  ) -> FixedTelephonyProfile {
    return FixedTelephonyProfile(
      id: id ?? self.id,
      lists: lists ?? self.lists,
      phoneNumber: phoneNumber ?? self.phoneNumber
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
