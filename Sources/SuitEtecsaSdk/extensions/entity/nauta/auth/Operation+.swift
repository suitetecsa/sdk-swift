import Foundation

extension Operation: Codable {
  enum CodingKeys: String, CodingKey {
    case alertServiceProfile = "alteraPerfilServicio"
    case eCommerce = "comercioElectronico"
    case id = "id"
    case method = "metodo"
    case mode = "modo"
    case operation = "operacion"
    case parameters = "parametros"
    case type = "tipo"
    case url = "url"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    alertServiceProfile = try container.decode(String.self, forKey: .alertServiceProfile)
    eCommerce = try container.decode(String.self, forKey: .eCommerce) == "true"
    id = try container.decode(String.self, forKey: .id)
    method = try container.decode(String.self, forKey: .method)
    mode = try container.decode(String.self, forKey: .mode)
    operation = try container.decode(String.self, forKey: .operation)
    parameters = try container.decode([String: Parameter].self, forKey: .parameters).compactMap { _, param in param}
    type = try container.decode(String.self, forKey: .type)
    url = try container.decode(String.self, forKey: .url)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(alertServiceProfile, forKey: .alertServiceProfile)
    try container.encode("\(eCommerce)", forKey: .eCommerce)
    try container.encode(id, forKey: .id)
    try container.encode(method, forKey: .method)
    try container.encode(mode, forKey: .mode)
    try container.encode(operation, forKey: .operation)
    try container.encode(
        Dictionary(uniqueKeysWithValues: parameters.map { ($0.name, $0) }),
        forKey: .parameters
    )
    try container.encode(type, forKey: .type)
    try container.encode(url, forKey: .url)
  }
}
