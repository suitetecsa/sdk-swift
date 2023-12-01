// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let navService = try NavService(json)

import Foundation

// MARK: - NavService
public struct NavService: Codable, Sendable {
  public let operations: [String: Operation]
  public let profile: NavProfile
  public let productType: String

  enum CodingKeys: String, CodingKey {
    case operations = "operaciones"
    case profile = "perfil"
    case productType = "tipoProducto"
  }

  public init(operations: [String: Operation], profile: NavProfile, productType: String) {
    self.operations = operations
    self.profile = profile
    self.productType = productType
  }
}

// MARK: NavService convenience initializers and mutators

extension NavService {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(NavService.self, from: data)
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
    profile: NavProfile? = nil,
    productType: String? = nil
  ) -> NavService {
    return NavService(
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
