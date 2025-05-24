import Foundation

public enum UserOrString: Codable, Sendable {
    case string(String)
    case user(User)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(User.self) {
            self = .user(x)
            return
        }
        throw DecodingError.typeMismatch(
            UserOrString.self,
            DecodingError.Context(
                codingPath: decoder.codingPath, debugDescription: "Wrong type for UserUnion"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .user(let x):
            try container.encode(x)
        }
    }
}
