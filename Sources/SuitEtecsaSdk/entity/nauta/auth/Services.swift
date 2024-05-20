import Foundation

public struct Services: Codable {
  public let mailServices: [MailService]
  public let navServices: [NavService]
  public let mobileServices: [MobileService]
  public let fixedTelephony: [FixedTelephony]

  enum CodingKeys: String, CodingKey {
    case mailServices = "Correo Nauta"
    case navServices = "Navegación"
    case mobileServices = "Servicios móviles"
    case fixedTelephony = "Telefonía fija"
  }
}
