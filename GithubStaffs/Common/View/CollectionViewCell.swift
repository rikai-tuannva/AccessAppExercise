//
//  CollectionViewCell.swift
//  BaseProject
//
//  Created by TuanNVA on 05/07/2021.
//

import Foundation
import RxSwift

class CollectionViewCell: UICollectionViewCell {
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func bind(viewModel: CellViewModel) {
        
    }
}
