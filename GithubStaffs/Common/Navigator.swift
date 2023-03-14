//
//  Navigator.swift
//  BaseProject
//
//  Created by TuanNVA on 04/07/2021.
//

import Foundation
import RxSwift

class Navigator{
    let disposeBag = DisposeBag()
    
    weak var viewController: ViewController?
    
    lazy var navigationController: UINavigationController? = {
        return self.viewController?.navigationController
    }()
    
    init(with viewController: ViewController){
        self.viewController = viewController
    }
    
    func showErrorAlert(){
        showAlert(title: "common_error".localized(),
                  message: "common_error_message".localized())
    }
    
    func showAlert(title: String?,
                   message: String?,
                   buttonTitles: [String]? = nil,
                   highlightedButtonIndex: Int? = nil,
                   completion: ((Int) -> Void)? = nil) {
        viewController?.showAlert(
            title: title,
            message: message,
            buttonTitles: buttonTitles,
            highlightedButtonIndex: highlightedButtonIndex,
            completion: completion
        )
    }}
