import Foundation

public struct RegisterUser: Codable, Sendable {
    public var param: [Param]
    public var captchatext: String
    public var idRequest: String
    
    enum CodingKeys: String, CodingKey {
        case param = "param"
        case captchatext = "captchatext"
        case idRequest = "idRequest"
    }
}

