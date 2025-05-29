import Foundation 

struct UserCreate: Codable, Sendable {
    var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}


