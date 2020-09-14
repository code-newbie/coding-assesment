//
//  Debugger.swift
//  Common
//
//  Created by Ilhammalik on 28/05/20.
//  Copyright © 2020 Ilhammalik. All rights reserved.
//

import Foundation

public func debugLog(_ items: Any..., fileName: String = #file,
                     functionName: String = #function,
                     lineNumber: Int = #line,
                     separator: String = " ",
                     terminator: String = "\n") {
    #if DEBUG
        let prefix = "[💬] \(fileName).\(functionName) line \(lineNumber): "
        let output = items.map { "\($0)" }.joined(separator: separator)
        Swift.print(prefix + output, terminator: terminator)
    #else
    #endif
}
