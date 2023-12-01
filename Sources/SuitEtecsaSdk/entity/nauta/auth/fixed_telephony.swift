// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fixedTelephony = try FixedTelephony(json)

import Foundation

// MARK: - FixedTelephony
public struct FixedTelephony: Codable, Sendable {
  public let operations: [String: Operation]
  public let profile: FixedTelephonyProfile

  enum CodingKeys: String, CodingKey {
    case operations = "operaciones"
    case profile = "perfil"
  }

  public init(operations: [String: Operation], profile: FixedTelephonyProfile) {
    self.operations = operations
    self.profile = profile
  }
}

// MARK: FixedTelephony convenience initializers and mutators

extension FixedTelephony {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(FixedTelephony.self, from: data)
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
    profile: FixedTelephonyProfile? = nil
  ) -> FixedTelephony {
    return FixedTelephony(
      operations: operations ?? self.operations,
      profile: profile ?? self.profile
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
