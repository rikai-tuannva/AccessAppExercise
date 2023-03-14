//
//  SplashViewController.swift
//  BaseProject
//
//  Created by TuanNVA on 08/07/2021.
//

import UIKit

class SplashViewController: ViewController {

    override var isNavigationHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func makeUI() {
        super.makeUI()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel as? SplashViewModel else { return }
        
        let input = SplashViewModel.Input()
        _ = viewModel.transform(input: input)
    }
}
