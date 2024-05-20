import Foundation

struct LoginResponseJson: Codable {
  let resp: LoginResponse

  enum CodingKeys: String, CodingKey {
    case resp
  }
}
