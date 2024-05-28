public struct SessionTime {
  public let value: String

  public var errorop: Bool {
    return value == "errorop"
  }

  public var asSeconds: Int? {
    let components = value.split(separator: ":").compactMap { Int($0) }
    return components.count == 3 ? components[0] * 3600 + components[1] * 60 + components[2] : nil
  }

  public var asMillis: Int? {
    let components = value.split(separator: ":").compactMap { Int($0) }
    return components.count == 3
      ? ((components[0] * 3600 + components[1] * 60 + components[2]) * 1000) : nil
  }
}
