import Foundation

extension ValidateUser {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.param = try container.decode([Param].self, forKey: .param)
    }
}
