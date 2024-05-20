import Alamofire
import Foundation

public class NetworkSession {
  let session = Session(redirectHandler: Redirector(behavior: .follow))

  public init() {}

  public func get(url: URL) async -> Result<Data, Error> {
    let request = session.request(url)
    let stringResponse = await request.serializingData().response

    switch stringResponse.result {
    case .success(let content):
      return Result.success(content)
    case .failure(let error):
      return Result.failure(error)
    }
  }

  public func post(url: URL, parameters: [String: Any]) async -> Result<Data, Error> {
    let request = session.request(url, method: .post, parameters: parameters)
    let stringResponse = await request.serializingData().response

    switch stringResponse.result {
    case .success(let content):
      return Result.success(content)
    case .failure(let error):
      return Result.failure(error)
    }
  }
}
