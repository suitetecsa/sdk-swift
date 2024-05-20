import Foundation

extension MobileProfile: Codable {
    enum CodingKeys: String, CodingKey {
    case lte = "4G"
    case advanceBalance = "Adelanta Saldo"
    case status = "Estado"
    case lockDate = "Fecha de Bloqueo"
    case deletionDate = "Fecha de Eliminación"
    case saleDate = "Fecha de Venta"
    case id = "id"
    case internet = "Internet"
    case lists = "Listas"
    case currency = "Moneda"
    case phoneNumber = "Número de Teléfono"
    case mainBalance = "Saldo Principal"
    case consumptionRate = "Tarifa por Consumo"
  }

  enum ListsKeys: String, CodingKey {
    case plans = "Planes"
    case bonuses = "Bonos"
  }

  public init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    lte = try container.decode(String.self, forKey: .lte)
    advanceBalance = try container.decode(String.self, forKey: .advanceBalance)
    status = try container.decode(String.self, forKey: .status)
    lockDate = try container.decode(String.self, forKey: .lockDate)
    deletionDate = try container.decode(String.self, forKey: .deletionDate)
    saleDate = try container.decode(String.self, forKey: .saleDate)
    id = try container.decode(String.self, forKey: .id)
    internet = try container.decode(String.self, forKey: .internet)
    currency = try container.decode(String.self, forKey: .currency)
    phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
    mainBalance = try container.decode(String.self, forKey: .mainBalance)
    consumptionRate = try container.decode(String.self, forKey: .consumptionRate)

    let lists = try container.nestedContainer(keyedBy: ListsKeys.self, forKey: .lists)
    bonuses =
      try lists.decodeIfPresent([String: MobileBonus].self, forKey: .bonuses)?.compactMap {
        _, bonus in bonus
      } ?? []
    plans =
      try lists.decodeIfPresent([String: MobilePlan].self, forKey: .plans)?.compactMap {
        _, plans in plans
      } ?? []
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(lte, forKey: .lte)
    try container.encode(advanceBalance, forKey: .advanceBalance)
    try container.encode(status, forKey: .status)
    try container.encode(lockDate, forKey: .lockDate)
    try container.encode(deletionDate, forKey: .deletionDate)
    try container.encode(saleDate, forKey: .saleDate)
    try container.encode(id, forKey: .id)
    try container.encode(internet, forKey: .internet)
    try container.encode(currency, forKey: .currency)
    try container.encode(phoneNumber, forKey: .phoneNumber)
    try container.encode(mainBalance, forKey: .mainBalance)
    try container.encode(consumptionRate, forKey: .consumptionRate)

    var listsContainer = container.nestedContainer(keyedBy: ListsKeys.self, forKey: .lists)
    if !bonuses.isEmpty {
      let bonusesDictionary = Dictionary(uniqueKeysWithValues: bonuses.map { ("\(UUID())", $0) })
      try listsContainer.encode(bonusesDictionary, forKey: .bonuses)
    }
    if !plans.isEmpty {
      let plansDictionary = Dictionary(uniqueKeysWithValues: plans.map { ("\(UUID())", $0) })
      try listsContainer.encode(plansDictionary, forKey: .plans)
    }
  }
}
