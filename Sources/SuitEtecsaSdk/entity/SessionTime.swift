public struct SessionTime {
  public let value: String

  public var errorop: Bool {
    return value == "errorop"
  }

  public var asSeconds: Int {
    guard !errorop else { return -1 }
    let components = value.split(separator: ":").compactMap { Int($0) }
    return components[0] * 3600 + components[1] * 60 + components[2]
  }

  public var asMillis: Int {
    let seconds = asSeconds
    return seconds != -1 ? seconds * 1000 : seconds
  }
}
