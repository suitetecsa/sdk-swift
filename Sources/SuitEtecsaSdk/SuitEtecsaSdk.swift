// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alamofire
import Foundation
import SwiftyBeaver

public let log = SwiftyBeaver.self

let console = ConsoleDestination()
public func loggerConfig() {
    console.format = "$DHH:mm:ss$d $L $M"
    log.addDestination(console)
}

let session: Session = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30
    configuration.timeoutIntervalForResource = 3000

    let interceptor = RetryPolicy(
        retryLimit: 3,
        exponentialBackoffBase: 2,  // Base para el tiempo de espera exponencial
        exponentialBackoffScale: 0.5,  // Escala del backoff
        retryableHTTPMethods: [.get, .post, .put, .delete],  // Métodos HTTP a reintentar
        retryableHTTPStatusCodes: [408, 500, 502, 503, 504],  // Códigos HTTP a reintentar
        retryableURLErrorCodes: [
            URLError.networkConnectionLost,
            URLError.notConnectedToInternet,
            URLError.timedOut,
            URLError.cannotFindHost,
            URLError.cannotConnectToHost,
        ]
    )

    return Session(configuration: configuration, interceptor: interceptor)
}()
