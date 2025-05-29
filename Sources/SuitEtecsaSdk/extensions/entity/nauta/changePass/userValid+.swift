import Foundation 

extension UserValid {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.param = try container.decode([Params].self, forKey: .param)
        self.idRequest = try container.decode(String.self, forKey: .idRequest)
        self.captchatext = try container.decode(String.self, forKey: .captchatext)
        self.data = try container.decode(DataResp.self, forKey: .data)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(param, forKey: .param)
        try container.encode(idRequest, forKey: .idRequest)
        try container.encode(captchatext, forKey: .captchatext)
        try container.encode(data, forKey: .data)
    }
}

extension Params {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(String.self, forKey: .value)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
    }
}

extension DataResp {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(Datas.self, forKey: .data)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
}

extension Datas {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultado = try container.decode(String.self, forKey: .resultado)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(resultado, forKey: .resultado)
    }
}