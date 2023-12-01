// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mobileService = try MobileService(json)

import Foundation

// MARK: - MobileService
public struct MobileService: Codable, Sendable {
  public let profile: MobileProfile

  enum CodingKeys: String, CodingKey {
    case profile = "perfil"
  }

  public init(profile: MobileProfile) {
    self.profile = profile
  }
}

// MARK: MobileService convenience initializers and mutators

extension MobileService {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(MobileService.self, from: data)
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
    profile: MobileProfile? = nil
  ) -> MobileService {
    return MobileService(
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
