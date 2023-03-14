//
//  LogManager.swift
//  BaseProject
//
//  Created by TuanNVA on 04/07/2021.
//

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self

//Can use Logger replace for SwiftyBeaver
private class Logger {
    class func verbose() {}
    class func debug() {}
    class func info() {}
    class func warning() {}
    class func error() {}
}
