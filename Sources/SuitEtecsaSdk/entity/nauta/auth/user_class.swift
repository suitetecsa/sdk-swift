// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userClass = try UserClass(json)

import Foundation

// MARK: - UserClass
public struct UserClass: Codable, Sendable {
  public let client: Client
  public let completed: String
  public let lastUpdate: String
  public let services: Services
  public let updatedServices: String

  enum CodingKeys: String, CodingKey {
    case client = "cliente"
    case completed = "completado"
    case lastUpdate = "fechaActualizacion"
    case services = "Servicios"
    case updatedServices = "servicios_actualizados"
  }

  public init(
    client: Client, completed: String, lastUpdate: String, services: Services,
    updatedServices: String
  ) {
    self.client = client
    self.completed = completed
    self.lastUpdate = lastUpdate
    self.services = services
    self.updatedServices = updatedServices
  }
}

// MARK: UserClass convenience initializers and mutators

extension UserClass {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(UserClass.self, from: data)
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
    client: Client? = nil,
    completed: String? = nil,
    lastUpdate: String? = nil,
    services: Services? = nil,
    updatedServices: String? = nil
  ) -> UserClass {
    return UserClass(
      client: client ?? self.client,
      completed: completed ?? self.completed,
      lastUpdate: lastUpdate ?? self.lastUpdate,
      services: services ?? self.services,
      updatedServices: updatedServices ?? self.updatedServices
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
