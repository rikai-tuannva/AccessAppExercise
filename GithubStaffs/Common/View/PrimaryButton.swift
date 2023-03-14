//
//  PrimaryButton.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit

class PrimaryButton: UIButton {
    
    @IBInspectable var  customFontSize: CGFloat = 16{
        didSet{
            commonInit()
        }
    }
    
    @IBInspectable var customBackgroundColor: UIColor = .buttonPrimaryColor{
        didSet{
            commonInit()
        }
    }
    @IBInspectable var customTextColor: UIColor = .textButtonPrimaryColor{
        didSet{
            commonInit()
        }
    }
    @IBInspectable var customBorderColor: UIColor = .buttonPrimaryColor{
        didSet{
            commonInit()
        }
    }
    @IBInspectable var customBorderWidth: CGFloat = 0{
        didSet{
            commonInit()
        }
    }
    
    @IBInspectable var customCornerRadius: CGFloat = 0{
        didSet{
            commonInit()
        }
    }
    
    @IBInspectable var hasShadow: Bool = false{
        didSet{
            if hasShadow{
                self.layer.applyShadow(color: UIColor.shadowColor, alpha: 1, x: 0, y: 3, blur: 3, spread: 5)
            }else{
                self.layer.shadowOpacity = 0
            }
        }
    }
    var isError: Bool = false{
        didSet{
            if isError{
                self.layer.borderColor = UIColor.textHighlightColor.cgColor
            }else{
                self.layer.borderColor = UIColor.textHighlightColor.cgColor
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
        self.clipsToBounds = true
        self.backgroundColor = customBackgroundColor
        self.layer.borderColor = customBorderColor.cgColor
        self.layer.borderWidth = customBorderWidth
        self.layer.cornerRadius = self.customCornerRadius
        self.titleLabel?.font = UIFont.boldFont(size: customFontSize)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.lineBreakMode = .byClipping //<-- MAGIC LINE
        self.setTitleColor(self.customTextColor, for: .normal)
        UIView.performWithoutAnimation {
            let title = self.title(for: .normal)?.localized() ?? ""
            self.setTitle(title, for: .normal)
            self.layoutIfNeeded()
        }
    }
    
    override  func layoutSubviews() {
        super.layoutSubviews()
        if hasShadow {
            self.layer.applyShadow(color: UIColor.shadowColor)
        }else{
            self.layer.shadowOpacity = 0
        }
    }
    
    override var isEnabled: Bool{
        didSet{
            if (!isEnabled){
                alpha = 0.5
            }else{
                alpha = 1
            }
        }
    }
    override var isHighlighted: Bool{
        didSet{
            if (isHighlighted){
                alpha = 0.5
            }else{
                alpha = 1
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = true
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesCancelled(touches, with: event)
    }
    
}

class RounedButton: PrimaryButton {
    override func commonInit() {
        super.commonInit()
        self.layer.cornerRadius = self.bounds.height/2
    }
}
