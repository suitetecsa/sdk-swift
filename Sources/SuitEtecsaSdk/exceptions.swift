enum NautaException: Error {
    case loginException(message: String)
    case getInformationException(message: String)
    case topUpException(message: String)
    case transferException(message: String)
    case changePasswordException(message: String)
    case genery(message: String)
}
