//
//  ShadowView.swift
//  BaseProject
//
//  Created by TuanNVA on 05/07/2021.
//

import UIKit

class ShadowView: UIView {
    /// SwifterSwift: Shadow color of view; also inspectable from Storyboard.
    @IBInspectable var shadowColor: UIColor = .shadowColor {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }

    /// SwifterSwift: Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 2, height: 2) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }

    /// SwifterSwift: Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }

    /// SwifterSwift: Shadow radius of view; also inspectable from Storyboard.
    @IBInspectable var shadowRadius: CGFloat = -1 {
        didSet{
            if shadowRadius == -1 {
                shadowRadius = self.frame.height/10
            }
            layer.shadowRadius = shadowRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        self.layer.applyShadow(color: shadowColor,
                               alpha: shadowOpacity,
                               x: shadowOffset.width,
                               y: shadowOffset.height,
                               blur: shadowRadius * 2,
                               spread: 0)
    }
}
