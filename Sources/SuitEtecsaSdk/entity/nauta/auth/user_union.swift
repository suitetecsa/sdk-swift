import Foundation

public enum UserUnion: Codable, Sendable {
  case string(String)
  case userClass(UserClass)

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let x = try? container.decode(String.self) {
      self = .string(x)
      return
    }
    if let x = try? container.decode(UserClass.self) {
      self = .userClass(x)
      return
    }
    throw DecodingError.typeMismatch(
      UserUnion.self,
      DecodingError.Context(
        codingPath: decoder.codingPath, debugDescription: "Wrong type for UserUnion"))
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .string(let x):
      try container.encode(x)
    case .userClass(let x):
      try container.encode(x)
    }
  }
}
