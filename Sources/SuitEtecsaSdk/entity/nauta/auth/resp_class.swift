// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let respClass = try RespClass(json)

import Foundation

// MARK: - RespClass
public struct RespClass: Codable, Sendable {
  public let result: String
  public let token: String
  public let user: UserUnion

  enum CodingKeys: String, CodingKey {
    case result = "resultado"
    case token = "token"
    case user = "user"
  }

  public init(result: String, token: String, user: UserUnion) {
    self.result = result
    self.token = token
    self.user = user
  }
}

// MARK: RespClass convenience initializers and mutators

extension RespClass {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(RespClass.self, from: data)
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
    result: String? = nil,
    token: String? = nil,
    user: UserUnion? = nil
  ) -> RespClass {
    return RespClass(
      result: result ?? self.result,
      token: token ?? self.token,
      user: user ?? self.user
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
