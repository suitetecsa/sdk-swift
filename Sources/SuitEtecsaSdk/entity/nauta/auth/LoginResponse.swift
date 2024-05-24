import Foundation

public struct LoginResponse: Codable {
  public let result, token: String
  public let user: UserOrString

  enum CodingKeys: String, CodingKey {
    case result = "resultado"
    case token = "token"
    case user = "user"
  }
}
