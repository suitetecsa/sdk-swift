public struct MobileProfile: Sendable {
    public let lte: String
    public let advanceBalance: String
    public let status: String
    public let lockDate: String
    public let deletionDate: String
    public let saleDate: String
    public let id: String
    public let internet: String
    public let currency: String
    public let phoneNumber: String
    public let mainBalance: String
    public let consumptionRate: String
    public let plans: [MobilePlan]
    public let bonuses: [MobileBonus]
}
