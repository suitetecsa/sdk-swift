import Foundation 

struct ChangePass: Codable, Sendable {
    public var param: [Param]

    enum CodingKeys: String, CodingKey {
        case param = "param"
    }
}

