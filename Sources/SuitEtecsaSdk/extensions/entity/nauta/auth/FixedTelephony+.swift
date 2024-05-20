extension FixedTelephony: Codable {
  enum CodingKeys: String, CodingKey {
    case operations = "operaciones"
    case profile = "perfil"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    operations = try container.decode([String: Operation].self, forKey: .operations).compactMap {
      _, operation in operation
    }
    profile = try container.decode(FixedTelephonyProfile.self, forKey: .profile)
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(
      Dictionary(uniqueKeysWithValues: operations.map { ($0.operation, $0) }),
      forKey: .operations
    )
    try container.encode(profile, forKey: .profile)
  }
}
