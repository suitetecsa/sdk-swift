import Foundation

public struct RegisterUser: Codable, Sendable {
    public var param: [Paramsssss]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

public struct Paramsssss: Codable, Sendable {
    public var name: String 
    public var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}