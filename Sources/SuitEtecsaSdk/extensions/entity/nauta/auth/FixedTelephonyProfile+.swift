extension FixedTelephonyProfile: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case phoneNumber = "Número de teléfono"
    case lists = "Listas"
  }

  enum ServicesKeys: String, CodingKey {
    case supplementaryServices = "Servicios suplementarios"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    phoneNumber = try container.decode(String.self, forKey: .phoneNumber)

    let lists = try container.nestedContainer(keyedBy: ServicesKeys.self, forKey: .lists)
    supplementaryServices = try lists.decode([String: ComplementaryService].self, forKey: .supplementaryServices).compactMap { _, service in service }
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(phoneNumber, forKey: .phoneNumber)


    var lists = container.nestedContainer(keyedBy: ServicesKeys.self, forKey: .lists)
    try lists.encode(
      Dictionary(uniqueKeysWithValues: supplementaryServices.map { ($0.service, $0) }),
      forKey: .supplementaryServices
    )
  }
}
