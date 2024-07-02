import Alamofire
import Foundation

enum NautaRouter: URLRequestConvertible {

  case getCaptcha
  case login(parameters: String)
  case users(token: String, parameters: String)
  case consults(apiToken: String, parameters: String)
  case operations(apiToken: String, parameters: String)
  case consultProccess(apiToken: String, parameters: String)
  case generateCode(apiToken: String, usuarioPortal: String)

  // Mark: - APIKey
  private var token: String? {
    switch self {
    case .getCaptcha: return nil
    case .login: return nil
    case .consults(let token, _), .operations(let token, _), .consultProccess(let token, _),
      .generateCode(let token, _), .users(let token, _):
      return token
    }
  }

  // MARK: - HTTPMethod
  private var method: HTTPMethod {
    switch self {
    case .getCaptcha: return .get
    case .login, .consults, .operations, .consultProccess, .generateCode, .users: return .post
    }
  }

  private var path: String {
    switch self {
    case .getCaptcha: return "/captcha/captcha?"
    case .login: return "/login"
    case .users: return "/users"
    case .consults: return "/consults"
    case .operations: return "/operations"
    case .consultProccess: return "/consults/process_response"
    case .generateCode: return "/operations/generarCodigo"
    }
  }

  private var parameters: Data? {
    switch self {
    case .getCaptcha: return nil
    case .login(let params), .consults(_, let params), .operations(_, let params),
      .consultProccess(_, let params), .users(_, let params):
      return params.data(using: .utf8)
    case .generateCode(_, let usuarioPortal):
      return "{\"usuarioPortal\":\"\(usuarioPortal)\"}".data(using: .utf8)
    }
  }

  func asURLRequest() throws -> URLRequest {
    let base = URL(string: NautaApp.Server.baseURL)!
    let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
    let url = URL(string: baseAppend!)

    var urlRequest = URLRequest(url: url!)

    // HTTPMethod
    urlRequest.httpMethod = method.rawValue

    // HTTPHeaders
    if let token = token {
      urlRequest.setValue(
        "Bearer \(token)",
        forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue
      )
      urlRequest.setValue(
        createPasswordApp(),
        forHTTPHeaderField: HTTPHeaderField.passwordApp.rawValue
      )
      urlRequest.setValue(
        HTTPHeaderFieldValues.usernameApp.rawValue,
        forHTTPHeaderField: HTTPHeaderField.usernameApp.rawValue
      )
    }
    urlRequest.addValue(
      " Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
      forHTTPHeaderField: "User-Agent"
    )
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    // urlRequest.setValue(HTTPHeaderFieldValues.UserAgent.rawValue, forHTTPHeaderField: HTTPHeaderField.UserAgent.rawValue)

    // Parameters if added
    if let parameters = parameters { urlRequest.httpBody = parameters }

    return urlRequest
  }
}
