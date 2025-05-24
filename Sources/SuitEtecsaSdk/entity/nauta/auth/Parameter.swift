import Foundation

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
}
