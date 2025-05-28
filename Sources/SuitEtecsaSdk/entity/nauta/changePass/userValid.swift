import Foundation

struct UserValid: Codable, Sendable {
    public var param: [Params]
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

public struct Params: Codable, Sendable {
    public var name: String 
    public var value: String 

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
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