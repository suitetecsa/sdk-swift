import Foundation 

public struct ValidateCode: Codable, Sendable {
    var param: [Paramsss]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

public struct Paramsss: Codable, Sendable {
    var name: String 
    var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}