//
//  Config.swift
//  BaseProject
//
//  Created by TuanNVA on 05/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

struct Configs {
    static let platform = "ios"
    
    struct Network {
        static let apiBaseUrl = "https://api.github.com"
        
        // Becasue Github will remove token when upload it to github
        // So I split git for this example
        static let token_part1 = ""
        static let token_part2 = ""
        static let token_part3 = ""
        static let token = token_part1 + token_part2 + token_part3
    }
    
    struct DateFormart {
        static let serverDate: [String] = ["yyyy-MM-dd'T'HH:mm:ss.SSSZ", "yyyy-MM-dd'T'HH:mm:ss.SSS", "yyyy-MM-dd'T'HH:mm:ss"]
        static let shortDate = "yyyy-MM-dd"
    }
    
    struct UserDefaultsKeys {
        static let currentUser = "currentUser"
    }
    
    // MARK: - Constants
    enum Constants {
        static let delayButtonClick = RxTimeInterval.milliseconds(300)
    }
}
