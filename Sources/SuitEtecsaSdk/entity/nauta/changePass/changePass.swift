import Foundation 

public struct ChangePass: Codable, Sendable {
    public var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

public struct Param: Codable, Sendable {
    public var name: String 
    public var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}