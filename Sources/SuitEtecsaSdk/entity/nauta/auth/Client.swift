import Foundation

public struct Client {
  public let email, name, phoneNumber, portalUser: String
  public let mailNotifications, mobileNotifications: Bool
  public let operations: [Operation]
}
