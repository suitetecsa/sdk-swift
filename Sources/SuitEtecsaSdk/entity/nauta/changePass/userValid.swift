import Foundation

public struct UserValid: Codable, Sendable {
    public var param: [Param]
    public var idRequest: String 
    public var captchatext: String

    enum CodingKeys: String, CodingKey {
        case param = "param"
        case idRequest = "idRequest"
        case captchatext = "captchatext"
    }
}

public struct DataResp: Codable, Sendable {
    public let data: Datas

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

public struct Datas: Codable, Sendable {
    public let resultado: String 

    enum CodingKeys: String, CodingKey {
        case resultado = "resultado"
    }
}
