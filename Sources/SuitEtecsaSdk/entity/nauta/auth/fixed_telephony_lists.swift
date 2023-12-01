// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fixedTelephonyLists = try FixedTelephonyLists(json)

import Foundation

// MARK: - FixedTelephonyLists
public struct FixedTelephonyLists: Codable, Sendable {
  public let supplementaryServices: [String: ComplementaryService]

  enum CodingKeys: String, CodingKey {
    case supplementaryServices = "Servicios suplementarios"
  }

  public init(supplementaryServices: [String: ComplementaryService]) {
    self.supplementaryServices = supplementaryServices
  }
}

// MARK: FixedTelephonyLists convenience initializers and mutators

extension FixedTelephonyLists {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(FixedTelephonyLists.self, from: data)
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
    supplementaryServices: [String: ComplementaryService]? = nil
  ) -> FixedTelephonyLists {
    return FixedTelephonyLists(
      supplementaryServices: supplementaryServices ?? self.supplementaryServices
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
