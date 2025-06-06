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
    
    // MARK: - change pass
    
    public static func changePass(params: [Param], idRequest: String, captchatext: String, data: DataResp) async -> Result<UserValid, Error> {
        let jsonData = UserValid(
            param: params,
            idRequest: idRequest,
            captchatext: captchatext,
        )
        switch await performResponse(
            route: NautaRouter.changePass(params: jsonData),
            type: UserValid.self
        ).result {
        case .failure(let error): return Result.failure(error)
        case .success(let data): return Result.success(data)
        }
    }
    
    // MARK: - register account
    
    public static func registerAccount(param: [Param], captchatext: String, idRequest: String) async -> Result<RegisterUser, Error> {
        let jsonData = RegisterUser(
            param: param,
            captchatext: captchatext,
            idRequest: idRequest
        )
        switch await performResponse(
            route: NautaRouter.registerAccount(params: jsonData),
            type: RegisterUser.self
        ).result {
        case .failure(let error): return Result.failure(error)
        case .success(let data): return Result.success(data)
        }
    }
}
