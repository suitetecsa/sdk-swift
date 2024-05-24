public struct DataSession {
  public let username: String
  public let csrfHw: String
  public let wlanUserIp: String
  public let attributeUUID: String

  public init(username: String, csrfHw: String, wlanUserIp: String, attributeUUID: String) {
    self.username = username
    self.csrfHw = csrfHw
    self.wlanUserIp = wlanUserIp
    self.attributeUUID = attributeUUID
  }
}
