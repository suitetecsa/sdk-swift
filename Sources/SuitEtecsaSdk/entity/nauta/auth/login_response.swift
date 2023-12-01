// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginResponse = try LoginResponse(json)

import Foundation

// MARK: - LoginResponse
public struct LoginResponse: Codable, Sendable {
  public let resp: RespUnion

  enum CodingKeys: String, CodingKey {
    case resp = "resp"
  }

  public init(resp: RespUnion) {
    self.resp = resp
  }
}

// MARK: LoginResponse convenience initializers and mutators

extension LoginResponse {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(LoginResponse.self, from: data)
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
    resp: RespUnion? = nil
  ) -> LoginResponse {
    return LoginResponse(
      resp: resp ?? self.resp
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
