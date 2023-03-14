//
//  HomeNavigator.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import UIKit

class HomeNavigator: Navigator {

    // MARK: Route screen
    func pushToDetail(staff: Staff) {
        let viewController = DetailStaffViewController(nibName: DetailStaffViewController.className, bundle: nil)
        let navigator = DetailStaffNavigator(with: viewController)
        let viewModel = DetailStaffViewModel(navigator: navigator, staff: staff)
        viewController.viewModel = viewModel

        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
