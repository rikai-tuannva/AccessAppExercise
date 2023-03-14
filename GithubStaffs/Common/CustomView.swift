//
//  CustomView.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit
import SnapKit
import RxSwift

class CustomView: UIView {
    @IBOutlet private var contentView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(contentView)
        
        contentView.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
