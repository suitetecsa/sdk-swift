import Alamofire
import Foundation

enum ConnectRouter: URLRequestConvertible {

  case initConnect
  case connect(params: [String: Any], actionLogin: String)
  case loadInformation(params: [String: Any])
  case disconnect(params: [String: Any])

  private var method: HTTPMethod {
    switch self {
    case .initConnect, .disconnect: return .get
    case .connect, .loadInformation: return .post
    }
  }

  private var path: String {
    switch self {
    case .initConnect: return "/"
    case .connect(_, let actionLogin): return actionLogin
    case .loadInformation: return "/EtecsaQueryServlet"
    case .disconnect(let params):
      var urlSuffix = ""
      var count = 0
      params.keys.forEach { key in
        urlSuffix += "\(key)=\(params[key]!)"
        if count < params.keys.count - 1 { urlSuffix += "&" }
        count += 1
      }
      return "/LogoutServlet?\(urlSuffix)"
    }
  }

  private var parameters: [String: Any]? {
    switch self {
    case .initConnect, .disconnect: return nil
    case .connect(let params, _), .loadInformation(let params): return params
    }
  }

  func asURLRequest() throws -> URLRequest {
    let url =
      switch self {
      case .connect(_, let actionLogin): URL(string: actionLogin)
      default:
        let base = URL(string: ConnectApp.Server.baseUrl)!
        let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
        URL(string: baseAppend!)
      }

    var urlRequest = URLRequest(url: url!)

    urlRequest.httpMethod = method.rawValue

    return try URLEncoding.default.encode(urlRequest, with: parameters)
  }
}
