// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listas = try Listas(json)

import Foundation

// MARK: - Listas
public struct Listas: Codable, Sendable {
  public let bonuses: [String: MobileBonus]?
  public let plans: [String: MobilePlan]?

  enum CodingKeys: String, CodingKey {
    case bonuses = "Bonos"
    case plans = "Planes"
  }

  public init(bonuses: [String: MobileBonus]?, plans: [String: MobilePlan]?) {
    self.bonuses = bonuses
    self.plans = plans
  }
}

// MARK: Listas convenience initializers and mutators

extension Listas {
  public init(data: Data) throws {
    self = try newJSONDecoder().decode(Listas.self, from: data)
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
    bonuses: [String: MobileBonus]?? = nil,
    plans: [String: MobilePlan]?? = nil
  ) -> Listas {
    return Listas(
      bonuses: bonuses ?? self.bonuses,
      plans: plans ?? self.plans
    )
  }

  public func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }

  public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}
