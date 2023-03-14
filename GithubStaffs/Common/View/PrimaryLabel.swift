//
//  PrimaryLabel.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit

class PrimaryLabel: UILabel {
    @IBInspectable var paddingLeft:CGFloat = 0
    @IBInspectable var paddingRight:CGFloat = 0

    @IBInspectable var isBold: Bool = false{
        didSet {
            commonInit()
        }
    }
    
    @IBInspectable var isUnderline: Bool = false{
        didSet {
            commonInit()
        }
    }
    
    @IBInspectable var customFontSize: CGFloat = 16 {
        didSet{
            commonInit()
        }
    }
    @IBInspectable var customTextColor: UIColor = UIColor.textContentColor{
        didSet{
            commonInit()
        }
    }
    
    @IBInspectable var customLineSpacing: CGFloat = 4{
        didSet{
            commonInit()
        }
    }
    
    @IBInspectable var customLetterSpacing: CGFloat = 0{
        didSet{
            commonInit()
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + paddingLeft + paddingRight,
                      height: size.height)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (paddingLeft + paddingRight)
        }
    }
    
    var customAttributes: [NSAttributedString.Key : Any] {
        get {
            let font: UIFont = self.isBold ? UIFont.boldFont(size: self.customFontSize)
                : UIFont.mediumFont(size: self.customFontSize)
            self.font = font
            self.textColor = self.customTextColor
            let style = NSMutableParagraphStyle()
            style.lineSpacing = self.customLineSpacing
            style.lineBreakMode = NSLineBreakMode.byTruncatingTail
            style.alignment = self.textAlignment
            let attributedText = [
                NSAttributedString.Key.foregroundColor: self.customTextColor,
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.paragraphStyle: style,
                NSAttributedString.Key.kern: self.customLetterSpacing,
                .underlineStyle : self.isUnderline ? NSUnderlineStyle.single.rawValue : .zero
            ] as [NSAttributedString.Key : Any]
            return attributedText
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
        let result = NSMutableAttributedString.init(string: self.text?.localized() ?? "", attributes: self.customAttributes)
        self.attributedText =  result
    }

}

class ErrorLabel: PrimaryLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
        self.customTextColor = customTextColor != .textContentColor ? customTextColor : UIColor.textHighlightColor
    }
}

class BoldLabel: PrimaryLabel {
    override func awakeFromNib() {
        self.commonInit()
        self.isBold = true
        self.customFontSize = self.customFontSize == 16 ? 18 : self.customFontSize
        self.customTextColor = customTextColor != .textContentColor ? customTextColor : UIColor.textTitleColor
    }
}



class BlackLabel: PrimaryLabel {

    override func commonInit() {
        let font :UIFont = UIFont.blackFont(size: self.customFontSize)
        self.font = font
        self.textColor = self.customTextColor
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = self.customLineSpacing
        style.lineBreakMode = NSLineBreakMode.byTruncatingTail
        style.alignment = self.textAlignment
        let attributedText = [
            NSAttributedString.Key.foregroundColor : customTextColor,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.paragraphStyle: style
        ] as [NSAttributedString.Key : Any]
        
        let result = NSMutableAttributedString.init(string: self.text?.localized() ?? "", attributes: attributedText)
        self.attributedText =  result
    }
}

