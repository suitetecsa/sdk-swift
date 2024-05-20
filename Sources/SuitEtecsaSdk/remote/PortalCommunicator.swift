import Foundation

public protocol PortalCommunicator {
  func performAction<T>(action: Action, transform: (Data) -> T) async -> Result<T, Error>
  func performAction<T>(url: String, transform: (Data) -> T) async -> Result<T, Error>
}
