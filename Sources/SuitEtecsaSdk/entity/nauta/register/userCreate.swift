import Foundation 

public struct UserCreate: Codable, Sendable {
    public var param: [Paran]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

public struct Paran: Codable, Sendable {
    public var name: String 
    public var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

