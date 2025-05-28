import Foundation

public struct ValidateUser: Codable, Sendable {
    public var param: [Parans]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

public struct Parans: Codable, Sendable {
    public var name: String 
    public var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}