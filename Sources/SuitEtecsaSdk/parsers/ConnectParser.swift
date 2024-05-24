import Foundation
import SwiftSoup

class ConnectParser {
  private static func getInputs(_ formElement: Element) -> [String: String]? {
    if let inputs = try? formElement.select("input[name]") {
      return Dictionary(
        uniqueKeysWithValues: try! inputs.map { (try $0.attr("name"), try $0.attr("value")) })
    }
    return nil
  }

  static func parseLoginForm(_ content: Data?) -> (url: String, formMap: [String: String])? {
    if let data = content, let html = String(data: data, encoding: .utf8),
      let doc = try? SwiftSoup.parse(html).select("form.form").first(),
      let url = try? doc.attr("action"),
      let form = getInputs(doc)
    {
      return (url, form)
    }
    return nil
  }

  static func findError(_ content: Data?) -> String? {
    if let data = content, let html = String(data: data, encoding: .utf8) {
      log.info("Success html decode!")
      return html.parseError()
    }
    return nil
  }

  static func parseAttributeUUID(content: Data?) -> String? {
    if let data = content, let html = String(data: data, encoding: .utf8),
      let regex = try? NSRegularExpression(pattern: "ATTRIBUTE_UUID=(\\w+)&"),
      let match = regex.firstMatch(in: html, range: NSRange(html.startIndex..., in: html)),
      let uuidRange = Range(match.range(at: 1), in: html)
    {
      return String(html[uuidRange])
    }
    return nil
  }

  static func parseNautaConnectInformation(_ content: Data?) -> NautaConnectInformation? {
    let keys = [
      "account_status", "credit", "expiration_date", "access_areas", "from", "to", "time",
    ]

    if let data = content, let html = String(data: data, encoding: .utf8),
    let doc = try? SwiftSoup.parse(html) {
      let info = Dictionary(uniqueKeysWithValues: try! doc.select("#sessioninfo > tbody > tr > :not(td.key)").enumerated()
      .map { (index, element) in
        (keys[index], try! element.text().trimmingCharacters(in: .whitespacesAndNewlines))
      })

      let accountInfo = AccountInfo(
        accessAreas: info["access_areas"]!, accountStatus: info["account_status"]!,
        credit: info["credit"]!, expirationDate: info["expiration_date"]!)

      let lastsConnections = try! doc.select("#sesiontraza > tbody > tr").enumerated().map{ (index, tr) in
        let connection = Dictionary(uniqueKeysWithValues: try! tr.select("td").enumerated().map { (tdIndex, td) in
          (keys[tdIndex + 4], try td.text().trimmingCharacters(in: .whitespacesAndNewlines))
        })
        return LastsConnection(from: connection["from"]!, to: connection["to"]!, time: connection["time"]!)
      }
      return NautaConnectInformation(lastsConnections: lastsConnections, accountInfo: accountInfo)
    }
    return nil
  }
}
