public enum NautaException: Error {
    case failLogin(message: String)
    case failFetchInformation(message: String)
    case other(error: Error)
}
