// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let complementaryService = try ComplementaryService(json)

import Foundation

// MARK: - ComplementaryService
public struct ComplementaryService: Codable, Sendable {
  public let service: String
  public let value: String

  enum CodingKeys: String, CodingKey {
    case service = "Servicio"
    case value = "Valor"
  }

  public init(service: String, value: String) {
    self.service = service
    self.value = value
  }
}

// MARK: ComplementaryService convenience initializers and mutators

extension ComplementaryService {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(ComplementaryService.self, from: data)
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
    service: String? = nil,
    value: String? = nil
  ) -> ComplementaryService {
    return ComplementaryService(
      service: service ?? self.service,
      value: value ?? self.value
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
