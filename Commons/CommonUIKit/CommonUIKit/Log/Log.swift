//
//  Log.swift
//  CommonUIKit
//
//  Created by ILHAM on 12/09/20.
//

import Foundation

enum LogEvent: String {
    case error = "[‼️]" // error
    case info = "[ℹ️]" // info
    case debug = "[💬]" // debug
    case verbose = "[🔬]" // verbose
    case warning = "[⚠️]" // warning
    case severe = "[🔥]" // severe
}

struct Log {
    /// Print in debug only
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n", event: LogEvent = .debug) {
        #if DEBUG
            let output = items.map { "\($0)" }.joined(separator: separator)
            Swift.print(event.rawValue + output, terminator: terminator)
        #else
        #endif
    }
}
