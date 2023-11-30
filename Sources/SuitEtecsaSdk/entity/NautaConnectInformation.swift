// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import Foundation

// MARK: - NautaConnectInformation
public struct NautaConnectInformation {
  public let lastsConnections: [LastsConnection]
  public let accountInfo: AccountInfo
}

// MARK: - AccountInfo
public struct AccountInfo {
  public let accessAreas, accountStatus, credit, expirationDate: String
}

// MARK: - LastsConnection
public struct LastsConnection {
  public let from, to, time: String
}
