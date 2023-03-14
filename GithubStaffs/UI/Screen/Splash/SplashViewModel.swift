//
//  SplashViewModel.swift
//  BaseProject
//
//  Created by TuanNVA on 08/07/2021.
//

import UIKit

class SplashViewModel: ViewModel, ViewModelType {
    
    struct Input {
    }
    
    struct Output {
    }
    
    // MARK: - Stored properties
    let navigator: SplashNavigator
    
    // MARK: - Output properties
    init(navigator: SplashNavigator){
        self.navigator = navigator
        super.init(navigator: navigator)
    }
    
    // MARK: Methods
    func transform(input: Input) -> Output {
        routeToHome()
        return Output()
    }
    
    private func routeToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigator.pushToHomeScreen()
        }
    }
}
