import Alamofire
import Foundation
import SwiftSoup

private let redirector = Redirector(behavior: .doNotFollow)

public class ConnectApi {

  private static func sendRequest<T>(_ route: ConnectRouter, transform: @escaping (Data?) -> T?)
    async throws -> T?
  {
    return try await withCheckedThrowingContinuation {
      (continuation: CheckedContinuation<T?, Error>) in
      AF.request(route).redirect(using: redirector).response { response in
        switch response.result {
        case .failure(let afError):
          continuation.resume(throwing: NautaException.other(error: afError))
        case .success(let data):
          continuation.resume(returning: transform(data))
        }
      }
    }
  }

  public static func connect(username: String, password: String)
    async -> Result<DataSession, NautaException>
  {
    log.info("Fetching info from: \(String(describing: ConnectRouter.initConnect.url))")
    guard
      let (url, dataMap) = try? await sendRequest(
        ConnectRouter.initConnect, transform: ConnectParser.parseLoginForm)
    else {
      return Result.failure(
        NautaException.failLogin(message: "Fail to load required information!"))
    }

    log.info("Login in to internet")
    if let error = try? await sendRequest(
      ConnectRouter.connect(
        params: [
          "CSRFHW": dataMap["CSRFHW"]!,
          "wlanuserip": dataMap["wlanuserip"]!,
          "username": username,
          "password": password,
        ],
        actionLogin: url
      ), transform: ConnectParser.findError)
    {
      return Result.failure(NautaException.failLogin(message: error))
    }

    log.info("fetching uuid...")
    guard
      let uuid = try? await sendRequest(
        ConnectRouter.online(csrfHw: dataMap["CSRFHW"]!),
        transform: ConnectParser.parseAttributeUUID)
    else {
      return Result.failure(
        NautaException.failLogin(message: "Fail to get logout information!"))
    }

    return Result.success(
      DataSession(
        username: username, csrfHw: dataMap["CSRFHW"]!, wlanUserIp: dataMap["wlanuserip"]!,
        attributeUUID: uuid))
  }

  public static func getInfo(username: String, password: String) async -> Result<
    NautaConnectInformation, NautaException
  > {
    log.info("Fetching info from: \(String(describing: ConnectRouter.initConnect.url))")
    guard
      let (_, dataMap) = try? await sendRequest(
        ConnectRouter.initConnect, transform: ConnectParser.parseLoginForm)
    else {
      return Result.failure(
        NautaException.failLogin(message: "Fail to load required information!"))
    }
    let parameters = [
      "username": username,
      "password": password,
      "wlanuserip": dataMap["wlanuserip"]!,
      "CSRFHW": dataMap["CSRFHW"]!,
      "lang": "",
    ]

    guard
      let userDetails = try? await sendRequest(
        ConnectRouter.loadInformation(params: parameters),
        transform: ConnectParser.parseNautaConnectInformation)
    else {
      return Result.failure(NautaException.failLogin(message: "Fail to login"))
    }

    return Result.success(userDetails)
  }

  public static func getLeftTime(_ dataSession: DataSession) async -> Result<SessionTime, NautaException>
  {
    let parameters = [
      "op": "getLeftTime",
      "ATTRIBUTE_UUID": dataSession.attributeUUID,
      "CSRFHW": dataSession.csrfHw,
      "wlanuserip": dataSession.wlanUserIp,
      "username": dataSession.username,
    ]

    guard
      let remainingTime = try? await sendRequest(
        ConnectRouter.loadInformation(params: parameters),
        transform: { content in
          if let data = content, let time = String(data: data, encoding: .utf8) {
            return time
          }
          return nil
        })
    else {
      return Result.failure(
        NautaException.failFetchInformation(message: "Fail to obtain remaining time!"))
    }
    return Result.success(SessionTime(value: remainingTime))
  }

  public static func disconnect(_ dataSession: DataSession) async -> Result<Void, NautaException> {
    let parameters = [
      "username": dataSession.username,
      "wlanuserip": dataSession.wlanUserIp,
      "CSRFHW": dataSession.csrfHw,
      "ATTRIBUTE_UUID": dataSession.attributeUUID,
    ]

    guard
      let responseString = try? await sendRequest(
        ConnectRouter.disconnect(params: parameters),
        transform: { content in
          if let data = content, let response = String(data: data, encoding: .utf8) {
            return response
          }
          return nil
        })
    else {
      return Result.failure(NautaException.failLogin(message: "Fail to logout!"))
    }

    if !responseString.contains("SUCCESS") {
      return Result.failure(NautaException.failLogin(message: "Fail to logout!"))
    }
    return Result.success(())
  }
}
