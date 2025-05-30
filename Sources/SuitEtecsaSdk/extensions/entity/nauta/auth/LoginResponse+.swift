extension LoginResponse: Codable {
    var ok: Bool {
        self.result == "ok"
    }

    enum CodingKeys: String, CodingKey {
        case result = "resultado"
        case token = "token"
        case user = "user"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decode(String.self, forKey: .result)
        token = try container.decode(String.self, forKey: .token)
        user = try? container.decode(User.self, forKey: .user)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("\(result)", forKey: .result)
        try container.encode("\(token)", forKey: .token)
        try container.encode(user, forKey: .user)
    }
}
