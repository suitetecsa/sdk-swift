import Foundation

extension RegisterUser {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.param = try container.decode([Param].self, forKey: .param)
        self.captchatext = try container.decode(String.self, forKey: .captchatext)
        self.idRequest = try container.decode(String.self, forKey: .idRequest)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(param, forKey: .param)
        try container.encode(captchatext, forKey: .captchatext)
        try container.encode(idRequest, forKey: .idRequest)
    }
}

