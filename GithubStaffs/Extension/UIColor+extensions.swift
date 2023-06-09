//
//  UIColorExtension.swift
//  BaseProject
//
//  Created by TuanNVA on 04/07/2021.
//

import UIKit

// MARK: Constant
public extension UIColor {
    static let accentColor: UIColor = UIColor(named: "accentColor") ?? .white
    static let buttonPrimaryColor = UIColor(named: "buttonPrimaryColor") ?? .white
    static let buttonSecondaryColor = UIColor(named: "buttonSecondaryColor") ?? .white
    static let dividerColor = UIColor(named: "dividerColor") ?? .white
    static let dividerDarkColor = UIColor(named: "dividerDarkColor") ?? .white
    static let primaryColor = UIColor(named: "primaryColor") ?? .white
    static let primaryDarkColor = UIColor(named: "primaryDarkColor") ?? .white
    static let shadowColor = UIColor(named: "shadowColor") ?? .white
    static let textContentColor = UIColor(named: "textContentColor") ?? .white
    static let textHighlightColor = UIColor(named: "textHighlightColor") ?? .white
    static let textHintColor = UIColor(named: "textHintColor") ?? .white
    static let textTitleColor = UIColor(named: "textTitleColor") ?? .white
    static let textButtonPrimaryColor = UIColor(named: "textButtonPrimaryColor") ?? .white
    static let textButtonSecondaryColor = UIColor(named: "textButtonSecondaryColor") ?? .white
    static let borderColor = UIColor(named: "borderColor") ?? .white
}

// MARK: - Properties
public extension UIColor {
    /// Hexadecimal value string (read-only).
    var hexString: String {
        let components: [Int] = {
            let comps = cgColor.components!
            let components = comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
            return components.map { Int($0 * 255.0) }
        }()
        return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
    }
}

// MARK: - Initializers
public extension UIColor {
    /// Create Color from RGB values with optional transparency.
    ///
    /// - Parameters:
    ///   - red: red component.
    ///   - green: green component.
    ///   - blue: blue component.
    ///   - transparency: optional transparency value (default is 1).
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    /// SwifterSwift: Create Color from hexadecimal value with optional transparency.
    ///
    /// - Parameters:
    ///   - hex: hex Int (example: 0xDECEB5).
    ///   - transparency: optional transparency value (default is 1).
    convenience init?(hex: Int, transparency: CGFloat = 1) {
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
}

// MARK: - Social
public extension UIColor {
    
    /// Brand identity color of popular social media platform.
    struct App {
        private init() {}
        
        /// red: 59, green: 89, blue: 152
        public static let facebook = UIColor(red: 59, green: 89, blue: 152)!
        
        /// red: 0, green: 182, blue: 241
        public static let twitter = UIColor(red: 0, green: 182, blue: 241)!
    }
    
}


