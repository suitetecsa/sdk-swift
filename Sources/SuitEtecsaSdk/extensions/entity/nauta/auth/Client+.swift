extension Client: Codable {
  enum CodingKeys: String, CodingKey {
    case email = "email"
    case name = "nombre"
    case mailNotifications = "notificaciones_mail"
    case mobileNotifications = "notificaciones_movil"
    case operations = "operaciones"
    case phoneNumber = "telefono"
    case portalUser = "usuario_portal"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    email = try container.decode(String.self, forKey: .email)
    name = try container.decode(String.self, forKey: .name)
    mailNotifications = try container.decode(String.self, forKey: .mailNotifications) == "true"
    mobileNotifications = try container.decode(String.self, forKey: .mobileNotifications) == "true"
    operations = try container.decode([String: Operation].self, forKey: .operations).compactMap {
      _, operation in operation
    }
    phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    portalUser = try container.decode(String.self, forKey: .portalUser)
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(email, forKey: .email)
    try container.encode(name, forKey: .name)
    try container.encode("\(mailNotifications)", forKey: .mailNotifications)
    try container.encode("\(mobileNotifications)", forKey: .mobileNotifications)
    try container.encode(
      Dictionary(uniqueKeysWithValues: operations.map { ($0.operation, $0) }),
      forKey: .operations
    )
    try container.encode(phoneNumber, forKey: .phoneNumber)
    try container.encode(portalUser, forKey: .portalUser)
  }
}
