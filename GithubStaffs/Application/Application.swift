//
//  Application.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit

// MARK: Provide and manage API, Socket, Push notification,...
class Application: NSObject{
    static let shared = Application()
    
    var window: UIWindow?
    
    var apiProvider: ApiProvider

    private override init() {
        apiProvider = ApiProvider()
        super.init()
    }
    
    func presentInitialScreen(in window: UIWindow?) {
        guard let window = window else {
            fatalError("NQC's project - Window is undefined")
        }
        
        let splashVC = SplashViewController(nibName: SplashViewController.className, bundle: nil)
        let navigator = SplashNavigator(with: splashVC)
        let viewModel = SplashViewModel(navigator: navigator)
        splashVC.viewModel = viewModel

        window.rootViewController = UINavigationController(rootViewController: splashVC)
        
        if !window.isKeyWindow {
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
