//
//  CornerView.swift
//  BaseProject
//
//  Created by TuanNVA on 12/07/2021.
//

import UIKit


class ShadowRoundedView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.layer.applyShadow(color: UIColor.shadowColor, alpha: 0.5, x: 2, y: 2, blur: 10, spread: 0)
    }
}
