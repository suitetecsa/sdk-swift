import Foundation

struct ValidateUser: Codable, Sendable {
    var param: [Param]

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