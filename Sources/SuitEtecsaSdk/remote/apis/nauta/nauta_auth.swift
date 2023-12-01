import Alamofire
import Foundation

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public class NautaAuthApi {
  // generic call to re-use code
  @discardableResult private static func performResponse<T: Codable>(
    route: NautaRouter,
    type: T.Type
  ) async -> DataResponse<T, AFError> {
    print(await AF.request(route).serializingString().response)
    return await AF.request(route).serializingDecodable(type, decoder: JSONDecoder()).response
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
      type: LoginResponse.self
    ).result {
    case .failure(let error): return Result.failure(error)
    case .success(let data):
      switch data.resp {
      case .string(_): return Result.failure(NautaException.loginException(message: "Err One"))
      case .respClass(let resp):
        switch resp.user {
        case .string(_):
          return Result.failure(
            NautaException.loginException(
              message: (resp.result != "error") ? resp.result : "Bad username or password"))
        case .userClass(_): return Result.success(data)
        }
      }
    }
  }
}
