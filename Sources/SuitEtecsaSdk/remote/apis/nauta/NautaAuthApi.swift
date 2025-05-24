import Alamofire
import Foundation

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public class NautaAuthApi {
    @discardableResult private static func performResponse<T: Codable>(
        route: NautaRouter,
        type: T.Type
    ) async -> DataResponse<T, AFError> {
        return await session.request(route)
            .validate()
            .serializingDecodable(type, decoder: JSONDecoder())
            .response
    }

    // MARK: - getCaptcha
    public static func getCaptcha() async -> Result<CaptchaResponse, Error> {
        switch await performResponse(route: NautaRouter.getCaptcha, type: CaptchaResponse.self)
            .result
        {
        case .failure(let error): return Result.failure(error)
        case .success(let data): return Result.success(data)
        }
    }

    // MARK: - login
    public static func login(
        username: String, password: String, captchaCode: String, idRequest: String
    ) async -> Result<LoginResponse, Error> {

        let jsonData = try! LoginRequest(
            username: username,
            password: password,
            accountType: "USUARIO_PORTAL",
            idRequest: idRequest,
            captchatext: captchaCode
        ).jsonString()!
        switch await performResponse(
            route: NautaRouter.login(parameters: jsonData),
            type: LoginResponseJson.self
        ).result {
        case .failure(let error): return Result.failure(error)
        case .success(let data):
            return Result.success(data.resp)
        }
    }
}
