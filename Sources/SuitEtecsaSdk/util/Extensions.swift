import Foundation

public extension String {
    var asFullUrl: String { return "https://www.etecsa.cu\(self)"}
    func parseError() -> String? {
        let regex = try! NSRegularExpression(pattern: "alert\\(\"(?<reason>[^\"]*?)\"\\)", options: [])
        if let match = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)).last {
            let range = match.range(withName: "reason")
            if range.location != NSNotFound {
                return (self as NSString).substring(with: range)
            }
        }
        return nil
    }
}