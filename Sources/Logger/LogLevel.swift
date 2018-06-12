//
//  LogLevel.swift
//  Logger
//
//  Created by Tyler Anger on 2018-06-09.
//

import Foundation

public struct LogLevel {
    
    private static let MIN_LOG_LEVEL: Double = 0.0
    private static let MAX_LOG_LEVEL: Double = 600.0
    public static let any = LogLevel(MIN_LOG_LEVEL, name: "any")
    public static let debug = LogLevel(100, name: "debug", symbol: "✳️")
    public static let info = LogLevel(200, name: "info", symbol: "ℹ️")
    public static let warn = LogLevel(300, name: "warn", symbol: "⚠️")
    public static let error = LogLevel(400, name: "error", symbol: "🚫")
    public static let fatal = LogLevel(500, name: "fatal", symbol: "🆘")
    public static let none = LogLevel(MAX_LOG_LEVEL, name: "none")
    
    private let score: Double
    public let name: String
    public let STDName: String
    public let symbol: String?
    
    public init(_ score: Double, name: String, STDName: String, symbol: String?) {
        precondition(score >= LogLevel.MIN_LOG_LEVEL && score <= LogLevel.MAX_LOG_LEVEL, "Log level score must be greater than or equal to \(LogLevel.any.score) and less than or equal to \(LogLevel.none.score)")
        self.score = score
        self.name = name
        self.STDName = STDName
        self.symbol = symbol
    }
    
    public init(_ score: Double, name: String, STDName: String) {
        self.init(score, name: name, STDName: STDName, symbol: nil)
    }
    
    public init(_ score: Double, name: String) {
        self.init(score, name: name, STDName: name.uppercased())
    }
    
    public init(_ score: Double, name: String, symbol: String) {
        self.init(score, name: name, STDName: name.uppercased(), symbol: symbol)
    }
}

extension LogLevel: Comparable {
    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.score < rhs.score
    }
    
    public static func == (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.score == rhs.score
    }
    
}
extension LogLevel: CustomStringConvertible {
    public var description: String { return self.STDName }
}
