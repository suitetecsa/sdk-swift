// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parameter = try Parameter(json)

import Foundation

// MARK: - Parameter
public struct Parameter: Codable, Sendable {
  public let name: String
  public let order: String
  public let parameter: String
  public let type: String
  public let value: String

  enum CodingKeys: String, CodingKey {
    case name = "nombre"
    case order = "orden"
    case parameter = "parametro"
    case type = "tipo"
    case value = "valor"
  }

  public init(name: String, order: String, parameter: String, type: String, value: String) {
    self.name = name
    self.order = order
    self.parameter = parameter
    self.type = type
    self.value = value
  }
}

// MARK: Parameter convenience initializers and mutators

extension Parameter {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(Parameter.self, from: data)
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
    name: String? = nil,
    order: String? = nil,
    parameter: String? = nil,
    type: String? = nil,
    value: String? = nil
  ) -> Parameter {
    return Parameter(
      name: name ?? self.name,
      order: order ?? self.order,
      parameter: parameter ?? self.parameter,
      type: type ?? self.type,
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
