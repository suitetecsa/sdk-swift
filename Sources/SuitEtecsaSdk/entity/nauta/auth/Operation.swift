import Foundation

public struct Operation {
  public let alertServiceProfile, id, method, mode, operation, type, url: String
  public let eCommerce: Bool
  public let parameters: [Parameter]
}
