//
//  HomeViewModel.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let itemClicked: Driver<IndexPath>
    }
    
    struct Output {
        let items: BehaviorRelay<[Staff]>
    }
    
    // MARK: - Stored properties
    private let navigator: HomeNavigator
    // MARK: - Output properties
    private let staffs = BehaviorRelay<[Staff]>(value: [])
    
    
    init(navigator: HomeNavigator){
        self.navigator = navigator
        super.init(navigator: navigator)
        
        loadStaffs()
    }
    
    // MARK: Methods
    func transform(input: Input) -> Output {
        
        input.itemClicked
            .map{self.staffs.value[$0.row]}
            .drive(onNext: routeToDetail)
            .disposed(by: disposeBag)
        
        return Output(items: staffs)
    }
    
    private func loadStaffs() {
        Application.shared
            .apiProvider
            .getStaffs(since: 0, limit: 100)
            .trackActivity(loading)
            .subscribe(
                onNext: { [weak self] response in
                    guard let self = self else {
                        return
                    }
                    self.staffs.accept(response)
                }, onError: { [weak self] error in
                    guard let self = self else {
                        return
                    }
                    
                    self.navigator.showErrorAlert()
                }).disposed(by: disposeBag)
    }
    
    private func routeToDetail(staff: Staff){
        navigator.pushToDetail(staff: staff)
    }
}
