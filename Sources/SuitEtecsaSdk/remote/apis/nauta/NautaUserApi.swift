import Alamofire
import Foundation

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public class NautaUserApi {
    public static func users(token: String, email: String, lastUpdate: String) async -> Result<
        UserResponse, Error
    > {
        switch await performResponse(
            route: NautaRouter.users(
                token: token,
                parameters: try! UsersRequest(email: email, lastUpdate: lastUpdate).toJasonString()!
            ),
            type: UserResponseJson.self
        ).result {
        case .failure(let error): return Result.failure(error)
        case .success(let data):
            if let user = data.resp.user {
                if user.updatedServices && !user.mobileServices.isEmpty {
                    print(user.mobileServices)
                    return Result.success(data.resp)
                } else {
                    return await users(token: token, email: email, lastUpdate: user.lastUpdate)
                }
            } else {
                return Result.failure(
                    NautaException.failFetchInformation(message: data.resp.result))
            }
        }
    }
}
