// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let operation = try Operation(json)

import Foundation

// MARK: - Operation
public struct Operation: Codable, Sendable {
  public let alterServiceProfile: String
  public let eCommerce: String
  public let id: String
  public let method: String
  public let mode: String
  public let operation: String
  public let parameters: [String: Parameter]
  public let type: String
  public let url: String

  enum CodingKeys: String, CodingKey {
    case alterServiceProfile = "alteraPerfilServicio"
    case eCommerce = "comercioElectronico"
    case id = "id"
    case method = "metodo"
    case mode = "modo"
    case operation = "operacion"
    case parameters = "parametros"
    case type = "tipo"
    case url = "url"
  }

  public init(
    alterServiceProfile: String, eCommerce: String, id: String, method: String, mode: String,
    operation: String, parameters: [String: Parameter], type: String, url: String
  ) {
    self.alterServiceProfile = alterServiceProfile
    self.eCommerce = eCommerce
    self.id = id
    self.method = method
    self.mode = mode
    self.operation = operation
    self.parameters = parameters
    self.type = type
    self.url = url
  }
}

// MARK: Operation convenience initializers and mutators

extension Operation {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(Operation.self, from: data)
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
    alterServiceProfile: String? = nil,
    eCommerce: String? = nil,
    id: String? = nil,
    method: String? = nil,
    mode: String? = nil,
    operation: String? = nil,
    parameters: [String: Parameter]? = nil,
    type: String? = nil,
    url: String? = nil
  ) -> Operation {
    return Operation(
      alterServiceProfile: alterServiceProfile ?? self.alterServiceProfile,
      eCommerce: eCommerce ?? self.eCommerce,
      id: id ?? self.id,
      method: method ?? self.method,
      mode: mode ?? self.mode,
      operation: operation ?? self.operation,
      parameters: parameters ?? self.parameters,
      type: type ?? self.type,
      url: url ?? self.url
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
