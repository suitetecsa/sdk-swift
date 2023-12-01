
let connectDomain = "secure.etecsa.net"

enum HTTPHeaderField: String {
    case Authorization = "Authorization"
    case Accept = "Accept"
    case AcceptLanguage = "Accept-Language"
    case AcceptEncoding = "Accept-Encoding"
    case ContentType = "Content-Type"
    case Connection = "Connection"
    case Host = "Host"
    case IfNoneMatch = "If-None-Match"
    case Origin = "Origin"
    case Referer = "Referer"
    case SecFetchDest = "Sec-Fetch-Dest"
    case SecFetchMode = "Sec-Fetch-Mode"
    case SecFetchSite = "Sec-Fetch-Site"
    case TE = "TE"
    case UserAgent = "User-Agent"
    case secChUa = "sec-ch-ua"
    case secChUaMobile = "sec-ch-ua-mobile"
    case secChUaPlatform = "sec-ch-ua-platform"
    case usernameApp = "usernameApp"
    case passwordApp = "passwordApp"
}

enum HTTPHeaderFieldValues: String {
    case Accept = "*/*"
    case AcceptLanguage = "es,es-US;q=0.9,es-419;q=0.8,en;q=0.7"
    case AcceptEncoding = "gzip, deflate, br"
    case ContentType = "application/json"
    case Connection = "keep-alive"
    case HostNauta = "www.nauta.cu:5002"
    case HostET = "www.tienda.etecsa.cu"
    case IfNoneMatch = "W/\"4573-cba3C56jjnn1stlozXGQSy4RngA\""
    case OriginNauta = "https://www.nauta.cu"
    case OriginEtecsa = "https://www.tienda.etecsa.cu"
    case SecFetchDest = "empty"
    case SecFetchMode = "cors"
    case SecFetchSite = "same-site"
    case TE = "trailers"
    case UserAgent = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0"
    case secChUa = "Not_A Brand\";v=\"99\", \"Google Chrome\";v=\"109\", \"Chromium\";v=\"109\""
    case secChUaMobile = "?0"
    case secChUaPlatform = "\"Windows\""
    case usernameApp = "portal"
}