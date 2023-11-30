import Foundation
import SwiftSoup

class ConnectParser {
  private static func getInputs(formElement: Element) -> [String: String] {
    var inputs: [String: String] = [:]
    do {
      try formElement.select("input[name]").forEach { element in
        inputs[try element.attr("name")] = try element.attr("value")
      }
    } catch Exception.Error(_, let message) {
      print(message)
    } catch {
      // Manejar el error
      print("Error: \(error.localizedDescription)")
    }

    return inputs
  }

  static func parseLoginForm(content: Data) throws -> (url: String, formMap: [String: String]) {
    let html = String(data: content, encoding: .utf8)!
    if let doc = try? SwiftSoup.parse(html).select("form.form").first() {
      let form = getInputs(formElement: doc)
      let url = try doc.attr("action")
      return (url, form)
    }
    throw NautaException.genery(message: "Unknown error")
  }

  static func parseAttributeUUID(content: Data) throws -> String {
    let html = String(data: content, encoding: .utf8)!
    let pattern = "ATTRIBUTE_UUID=(\\w+)&"
    let regex = try? NSRegularExpression(pattern: pattern)
    if let match = regex?.firstMatch(in: html, range: NSRange(html.startIndex..., in: html)),
      let uuidRange = Range(match.range(at: 1), in: html)
    {
      let uuid = String(html[uuidRange])
      return uuid
    } else {
      throw NautaException.getInformationException(message: "String")
    }
  }

  static func parseNautaConnectInformation(content: Data) throws -> NautaConnectInformation {
    let html = String(data: content, encoding: .utf8)!
    let keys = [
      "account_status", "credit", "expiration_date", "access_areas", "from", "to", "time",
    ]

    if let doc = try? SwiftSoup.parse(html) {
      var info: [String: String] = [:]
      var lastsConnections: [LastsConnection] = []
      var count = 0
      try doc.select("#sessioninfo > tbody > tr > :not(td.key)").forEach { element in
        info[keys[count]] = try element.text().trimmingCharacters(in: .whitespacesAndNewlines)
        count += 1
      }

      let accountInfo = AccountInfo(
        accessAreas: info["access_areas"]!, accountStatus: info["account_status"]!,
        credit: info["credit"]!, expirationDate: info["expiration_date"]!)

      try doc.select("#sesiontraza > tbody > tr").forEach { tr in
        var connection: [String: String] = [:]
        var index = 0
        try tr.select("td").forEach { td in
          connection[keys[index + 4]] = try td.text().trimmingCharacters(
            in: .whitespacesAndNewlines)
          index += 1
        }

        lastsConnections.append(
          LastsConnection(
            from: connection["from"]!, to: connection["time"]!, time: connection["to"]!))
      }
      return NautaConnectInformation(lastsConnections: lastsConnections, accountInfo: accountInfo)
    }

    throw NautaException.getInformationException(message: "String")
  }
}
