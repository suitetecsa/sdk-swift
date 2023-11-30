import Foundation
import Alamofire

public func checkConnections(html: String) async -> Result<Bool, Error> {
    switch await AF.request(URLRequest(url: URL(string: "http://www.cubadebate.cu")!)).serializingString().response.result {
        case .failure(let error): return Result.failure(error)
        case .success(let html): return Result.success(html.contains(connectDomain))
    }
  }