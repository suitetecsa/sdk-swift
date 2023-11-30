
let connectDomain = "secure.etecsa.net"

struct ConnectApp {
    struct Server {
        static let baseUrl = "https://\(connectDomain):8443"
    }
}

let userPortalUrlBase = "https://www.portal.nauta.cu/"
let connectPortalUrlBase = "https://\(connectDomain):8443/"

let userPortalUrls: [Action : Any] = [
    Action.Login: "user/login/es-es",
    Action.LoadUserInformation: "useraaa/user_info",
    Action.Recharge: "useraaa/recharge_account",
    Action.Transfer: "useraaa/transfer_balance",
    Action.PayNautaHome: "useraaa/transfer_nautahogarpaid",
    Action.ChangePassword: "useraaa/change_password",
    Action.ChangeEmailPassword: "mail/change_password",
    Action.GetConnections : [
        "base": "useraaa/service_detail/",
        "summary": "useraaa/service_detail_summary/",
        "list": "useraaa/service_detail_list/"
    ],
    Action.GetRecharges: [
        "base": "useraaa/recharge_detail/",
        "summary": "useraaa/recharge_detail_summary/",
        "list": "useraaa/recharge_detail_list/"
    ],
    Action.GetTransfers: [
        "base": "useraaa/transfer_detail/",
        "summary": "useraaa/transfer_detail_summary/",
        "list": "useraaa/transfer_detail_list/"
    ],
    Action.GetQuotesPaid: [
        "base": "useraaa/nautahogarpaid_detail/",
        "summary": "useraaa/nautahogarpaid_detail_summary/",
        "list": "useraaa/nautahogarpaid_detail_list/"
    ],
    Action.Logout: "user/logout"
]

let connectPortalUrls = [
    Action.Logout: "LogoutServlet",
    Action.LoadUserInformation: "EtecsaQueryServlet",
    Action.CheckConnection: "http://www.cubadebate.cu/"
]
