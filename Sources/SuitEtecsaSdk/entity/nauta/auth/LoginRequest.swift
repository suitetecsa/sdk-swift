import Foundation
import Alamofire

public struct LoginRequest: Codable, Sendable {
    let username, password, accountType, idRequest: String
    let captchatext: String

    enum CodingKeys: String, CodingKey {
        case username, password, idRequest, captchatext
        case accountType = "tipoCuenta"
    }
}

extension LoginRequest {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LoginRequest.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        username: String? = nil,
        password: String? = nil,
        accountType: String? = nil,
        idRequest: String? = nil,
        captchatext: String? = nil
    ) -> LoginRequest {
        return LoginRequest(
            username: username ?? self.username,
            password: password ?? self.password,
            accountType: accountType ?? self.accountType,
            idRequest: idRequest ?? self.idRequest,
            captchatext: captchatext ?? self.captchatext
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
