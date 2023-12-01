import Foundation

public enum RespUnion: Codable, Sendable {
  case respClass(RespClass)
  case string(String)

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let x = try? container.decode(String.self) {
      self = .string(x)
      return
    }
    if let x = try? container.decode(RespClass.self) {
      self = .respClass(x)
      return
    }
    throw DecodingError.typeMismatch(
      RespUnion.self,
      DecodingError.Context(
        codingPath: decoder.codingPath, debugDescription: "Wrong type for RespUnion"))
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .respClass(let x):
      try container.encode(x)
    case .string(let x):
      try container.encode(x)
    }
  }
}
