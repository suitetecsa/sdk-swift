import Alamofire
import Foundation
import SwiftSoup

public class ConnectApi {

  private static func performAction<T>(
    route: ConnectRouter,
    tranform: (Data) throws -> T
  ) async -> Result<T, Error> {
    switch await AF.request(route).serializingData().response.result {
    case .failure(let error): return Result.failure(error)
    case .success(let data):
      return Result { try tranform(data) }
    }
  }

  public static func connect(username: String, password: String) async -> Result<DataSession, Error>
  {
    switch await performAction(
      route: ConnectRouter.initConnect, tranform: ConnectParser.parseLoginForm)
    {
    case .failure(let error): return Result.failure(error)
    case .success(let (url, dataMap)):
      let parameters = [
        "CSRFHW": dataMap["CSRFHW"]!,
        "wlanuserip": dataMap["wlanuserip"]!,
        "username": username,
        "password": password,
      ]
      switch await performAction(
        route: ConnectRouter.connect(params: parameters, actionLogin: url),
        tranform: ConnectParser.parseAttributeUUID)
      {
      case .failure(let err): return Result.failure(err)
      case .success(let uuid):
        return Result.success(
          DataSession(
            username: username, csrfHw: dataMap["CSRFHW"]!, wlanUserIp: dataMap["wlanuserip"]!,
            attributeUUID: uuid))
      }
    }
  }

  public static func getInfo(username: String, password: String) async -> Result<
    NautaConnectInformation, Error
  > {
    switch await performAction(
      route: ConnectRouter.initConnect, tranform: ConnectParser.parseLoginForm)
    {
    case .failure(let error): return Result.failure(error)
    case .success(let (_, dataMap)):
      let parameters = [
        "username": username,
        "password": password,
        "wlanuserip": dataMap["wlanuserip"]!,
        "CSRFHW": dataMap["CSRFHW"]!,
        "lang": "",
      ]
      return await performAction(
        route: ConnectRouter.loadInformation(params: parameters),
        tranform: ConnectParser.parseNautaConnectInformation)
    }
  }

  public static func getLeftTime(dataSession: DataSession) async -> Result<String, Error> {
    let parameters = [
      "op": "getLeftTime",
      "ATTRIBUTE_UUID": dataSession.attributeUUID,
      "CSRFHW": dataSession.csrfHw,
      "wlanuserip": dataSession.wlanUserIp,
      "username": dataSession.username,
    ]
    return await performAction(route: ConnectRouter.loadInformation(params: parameters)) { data in
      String(data: data, encoding: .utf8)!
    }
  }

  public static func disconnect(dataSession: DataSession) async -> Result<Void, Error> {
    let parameters = [
      "username": dataSession.username,
      "wlanuserip": dataSession.wlanUserIp,
      "CSRFHW": dataSession.csrfHw,
      "ATTRIBUTE_UUID": dataSession.attributeUUID,
    ]
    return await performAction(route: ConnectRouter.disconnect(params: parameters)) { data in
      if !String(data: data, encoding: .utf8)!.contains("SUCCESS") {
        throw NautaException.genery(message: "String")
      }
    }
  }
}
