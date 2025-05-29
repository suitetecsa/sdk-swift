import Foundation

struct UserValid: Codable, Sendable {
    public var param: [Param]
    public var idRequest: String 
    public var captchatext: String 
    public var data: DataResp 

    enum CodingKeys: String, CodingKey {
        case param = "param"
        case idRequest = "idRequest"
        case captchatext = "captchatext"
        case data 
    }
}

struct DataResp: Codable, Sendable {
    let data: Datas 

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Datas: Codable, Sendable {
    public let resultado: String 

    enum CodingKeys: String, CodingKey {
        case resultado = "resultado"
    }
}