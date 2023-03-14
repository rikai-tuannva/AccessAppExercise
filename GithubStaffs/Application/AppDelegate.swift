//
//  AppDelegate.swift
//  BaseProject
//
//  Created by TuanNVA on 04/07/2021.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let libsManager = LibsManager.shared
        
        libsManager.setupLibs()
        
        Application.shared.presentInitialScreen(in: window)
        
        return true
    }
}

