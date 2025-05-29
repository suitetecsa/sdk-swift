import Foundation

struct RegisterUser: Codable, Sendable {
    var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}
