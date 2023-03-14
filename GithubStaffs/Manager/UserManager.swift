//
//  UserManager.swift
//  BaseProject
//
//  Created by TuanNVA on 07/08/2021.
//

import Foundation
import RxSwift
import RxCocoa

class UserManager {
    
    /// The default singleton instance.
    static let shared = UserManager()
    
//    let currentUser: BehaviorRelay<UserInformation?>
//    
//    var isProfileLoaded: Bool {
//        return !(currentUser.value?.token?.isEmpty ?? true)
//    }
//    
//    private init() {
//        guard let data = UserDefaults.standard.object(forKey: Configs.UserDefaultsKeys.currentUser) as? Data else {
//            currentUser = BehaviorRelay<UserInformation?>(value: nil)
//            return
//        }
//        
//        let decoder = JSONDecoder()
//        let user = try? decoder.decode(UserInformation.self, from: data)
//        currentUser = BehaviorRelay<UserInformation?>(value: user)
//    }
//    
//    func saveUser(_ user: UserInformation) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(user) {
//            UserDefaults.standard.set(encoded, forKey: Configs.UserDefaultsKeys.currentUser)
//            currentUser.accept(user)
//        }
//    }
//    
//    func getAuthToken() -> String {
//        guard let userAuth = currentUser.value,
//              let accessToken = userAuth.token else {
//            return ""
//        }
//        
//        let tokenType = "bearer"
//        return tokenType + " " + accessToken
//    }
//    
//    func removeUser() {
//        UserDefaults.standard.set(nil, forKey: Configs.UserDefaultsKeys.currentUser)
//        currentUser.accept(nil)
//    }
}
