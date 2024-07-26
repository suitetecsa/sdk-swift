import Alamofire
import Foundation

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public class NautaUserApi {
  // generic call to re-use code
  @discardableResult private static func performResponse<T: Codable>(
    route: NautaRouter,
    type: T.Type
  ) async -> DataResponse<T, AFError> {
    print(await AF.request(route).serializingString().response)
    return await AF.request(route).serializingDecodable(type, decoder: JSONDecoder()).response
  }

  public static func users(token: String, email: String, lastUpdate: String) async -> Result<
    LoginResponse, Error
  > {
    switch await performResponse(
      route: NautaRouter.users(
        token: token,
        parameters: try! UsersRequest(email: email, lastUpdate: lastUpdate).toJasonString()!),
      type: LoginResponseJson.self
    ).result {
    case .failure(let error): return Result.failure(error)
    case .success(let data):
      if case UserOrString.user(let user) = data.resp.user {
        if user.updatedServices {
          return Result.success(data.resp)
        } else {
          return await users(token: token, email: email, lastUpdate: user.lastUpdate)
        }
      } else {
        return Result.failure(NautaException.failFetchInformation(message: data.resp.result))
      }
    }
  }
}
