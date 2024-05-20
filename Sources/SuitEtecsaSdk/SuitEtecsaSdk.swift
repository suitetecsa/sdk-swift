// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftyBeaver

public let log = SwiftyBeaver.self

let console = ConsoleDestination()
public func loggerConfig() {
  console.format = "$DHH:mm:ss$d $L $M"
  log.addDestination(console)
}
