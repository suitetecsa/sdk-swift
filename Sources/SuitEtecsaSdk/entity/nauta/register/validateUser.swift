import Foundation

struct ValidateUser: Codable, Sendable {
    var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}
