extension NavService: Codable {
    enum CodingKeys: String, CodingKey {
    case operations = "operaciones"
    case profile = "perfil"
    case productType = "tipoProducto"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    operations = try container.decode([String: Operation].self, forKey: .operations).compactMap { _, operation in operation}
    profile = try container.decode(NavProfile.self, forKey: .profile)
    productType = try container.decode(String.self, forKey: .productType)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(
        Dictionary(uniqueKeysWithValues: operations.map { ($0.operation, $0) }),
        forKey: .operations
    )
    try container.encode(profile, forKey: .profile)
    try container.encode(productType, forKey: .productType)
  }
}
