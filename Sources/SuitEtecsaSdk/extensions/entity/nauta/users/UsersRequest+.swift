import Foundation

extension UsersRequest: Codable {
  enum CodingKeys: String, CodingKey {
    case email
    case lastUpdate = "ultimaActualizacion"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    email = try container.decode(String.self, forKey: .email)
    lastUpdate = try container.decode(String.self, forKey: .lastUpdate)
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(email, forKey: .email)
    try container.encode(lastUpdate, forKey: .lastUpdate)
  }

  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  func toJasonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: .utf8)
  }
}
