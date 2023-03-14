//
//  SplashNavigator.swift
//  BaseProject
//
//  Created by TuanNVA on 08/07/2021.
//

import UIKit

class SplashNavigator: Navigator {

    // MARK: Route screen
    func pushToHomeScreen() {
        let viewController = HomeViewController(nibName: HomeViewController.className, bundle: nil)
        let navigator = HomeNavigator(with: viewController)
        let viewModel = HomeViewModel(navigator: navigator)
        viewController.viewModel = viewModel

        navigationController?.pushViewController(viewController, animated: true)
    }
}
