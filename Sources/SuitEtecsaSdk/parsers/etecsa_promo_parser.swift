import Foundation
import SwiftSoup

public func getBanners() async throws -> [Promotion] {
  var promotions = [Promotion]()
  let session = NetworkSession()
  let resp = await session.get(url: URL(string: "https://www.etecsa.cu")!)
  switch resp {
  case .failure(let error): throw error
  case .success(let data):
    let html = try SwiftSoup.parse(String(data: data, encoding: .utf8)!)
    let carouselHtml = try html.select(".carousel-item")
    try carouselHtml.forEach { banner in
      let contentHtml = try banner.select(".mipromocion-contenido").first()

      guard let background = try? banner.select("div[style]").first()?.attr("style") else {
        print("No background")
        throw NSError(domain: "", code: 0)
      }
      guard
        let regex = try? NSRegularExpression(
          pattern: "background: url\\(['\"]?([^'\")]+)['\"]?\\);", options: [])
      else {
        print("No regex")
        throw NSError(domain: "", code: 0)
      }
      let range = NSRange(
        location: 0,
        length: background.trimmingCharacters(in: .whitespacesAndNewlines).count)
      guard
        let match = regex.firstMatch(
          in: background.trimmingCharacters(in: .whitespacesAndNewlines), options: [],
          range: range)
      else {
        print("No match")
        throw NSError(domain: "", code: 0)
      }
      let backgroundUrlRange = match.range(at: 1)
      let backgroundUrl =
        (background.trimmingCharacters(in: .whitespacesAndNewlines) as NSString)
        .substring(with: backgroundUrlRange)
      let imageSvg = try contentHtml?.select("img").first()?.attr("src")
      let url = try contentHtml?.select("a").attr("href")

      promotions.append(Promotion(backgroundUrl: backgroundUrl, imageSvg: imageSvg!, url: url!))
    }
    return promotions
  }
}
