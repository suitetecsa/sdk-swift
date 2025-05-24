import Foundation

struct UserResponseJson: Codable {
    let resp: UserResponse

    enum CodingKeys: String, CodingKey {
        case resp
    }
}
