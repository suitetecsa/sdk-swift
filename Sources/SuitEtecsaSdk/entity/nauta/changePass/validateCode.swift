import Foundation 

struct ValidateCode: Codable, Sendable {
    var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}
