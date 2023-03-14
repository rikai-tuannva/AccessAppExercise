//
//  DetailStaffViewModel.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class DetailStaffViewModel: ViewModel, ViewModelType {
    
    struct Input {
    }
    
    struct Output {
        let staff: BehaviorRelay<Staff?>
    }
    
    // MARK: - Stored properties
    private let navigator: DetailStaffNavigator
    
    // MARK: - Output properties
    private let staff = BehaviorRelay<Staff?>(value: nil)
    
    init(navigator: DetailStaffNavigator, staff: Staff){
        self.navigator = navigator
        super.init(navigator: navigator)
        
        loadDetailStaff(username: staff.login!)
    }
    
    // MARK: Methods
    func transform(input: Input) -> Output {
        return Output(staff: staff)
    }
    
    private func loadDetailStaff(username: String) {
        Application.shared
            .apiProvider
            .getDetailStaff(username: username)
            .trackActivity(loading)
            .subscribe(
                onNext: { [weak self] response in
                    guard let self = self else {
                        return
                    }
                    self.staff.accept(response)
                }, onError: { [weak self] error in
                    guard let self = self else {
                        return
                    }
                    
                    self.navigator.showErrorAlert()
                }).disposed(by: disposeBag)
    }
}
