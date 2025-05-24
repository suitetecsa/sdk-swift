import Foundation

public struct ComplementaryService: Codable, Sendable {
    public let service: String
    public let value: String

    enum CodingKeys: String, CodingKey {
        case service = "Servicio"
        case value = "Valor"
    }
}
