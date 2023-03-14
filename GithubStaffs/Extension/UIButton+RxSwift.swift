//
//  UIButton+RxSwift.swift
//  BaseProject
//
//  Created by TuanNVA on 05/08/2021.
//

import Foundation
import RxCocoa
import RxSwift
import Kingfisher

extension Reactive where Base: UIButton {

    public var tapDelayed: Observable<ControlEvent<Void>.Element>{
        return self.tap
                .debounce(Configs.Constants.delayButtonClick, scheduler: MainScheduler.instance)
    }
}
