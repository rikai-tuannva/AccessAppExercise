//
//  PrimaryTextField.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit

class PrimaryTextField: UITextField {
    @IBInspectable var maxLength: Int = 100
    @IBInspectable var paddingLeft: CGFloat = 20
    @IBInspectable var paddingRight: CGFloat = 20
    @IBInspectable var isBold: Bool = false
    
    @IBInspectable var leadingImage: UIImage? {
        didSet {
            
        }
    }
    
    @IBInspectable var customFontSize: CGFloat = 18{
        didSet{
            self.font = UIFont.boldFont(size: customFontSize)
        }
    }
    @IBInspectable var customBackgroundColor: UIColor = .primaryColor{
        didSet{
            self.backgroundColor = self.customBackgroundColor
        }
    }
    
    @IBInspectable var customTextColor: UIColor = .textTitleColor{
        didSet{
            self.textColor = self.customTextColor
        }
    }
    @IBInspectable var customBorderColor: UIColor = .borderColor{
        didSet{
            self.layer.borderColor = customBorderColor.cgColor
        }
    }
    @IBInspectable var customBorderWidth: CGFloat = 1{
        didSet{
            self.layer.borderWidth = customBorderWidth
        }
    }
    
    @IBInspectable var customCornerRadius: CGFloat = 4{
        didSet{
            self.layer.cornerRadius = self.customCornerRadius
        }
    }
    
    var isError: Bool = false{
        didSet{
            if isError{
                self.layer.borderColor = UIColor.accentColor.cgColor
            }else{
                self.layer.borderColor = customBorderColor.cgColor
            }
        }
    }
    
    
    var trimText: String {
        get{
            return (self.text ?? "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func updateView() {
        if let image = leadingImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
//            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
    }
    
    fileprivate func commonInit() {
        self.autocorrectionType = .no
        self.font = UIFont.boldFont(size: customFontSize)
        self.textColor = self.customTextColor
        self.layer.borderWidth = self.customBorderWidth
        self.layer.borderColor = self.customBorderColor.cgColor
        self.layer.cornerRadius = self.customCornerRadius
        self.backgroundColor = self.customBackgroundColor
        self.clearButtonMode = .whileEditing
        
        let placeholder = self.placeholder?.localized() ?? ""
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: UIColor.textHintColor,
            .font: UIFont.mediumFont(size: 16)
        ])
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1.0
            } else {
                self.alpha = 0.5
            }
        }
    }
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let edgeInsets = UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight);
        return bounds.inset(by:edgeInsets)
        
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let edgeInsets = UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight);
        return bounds.inset(by:edgeInsets)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let edgeInsets = UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight);
        return bounds.inset(by:edgeInsets)
    }
}

class RoundedTextField: PrimaryTextField{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height/2
        self.layer.masksToBounds = true
    }
}
