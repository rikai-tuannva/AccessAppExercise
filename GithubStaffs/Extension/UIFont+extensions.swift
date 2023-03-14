//
//  UIFont+extension.swift
//  BaseProject
//
//  Created by TuanNVA on 09/07/2021.
//

import UIKit

extension UIFont{
    class func boldFont(size:CGFloat)->UIFont{
        return UIFont.init(name: "Roboto-Bold", size: size)!
    }
    class func mediumFont(size:CGFloat)->UIFont{
        return UIFont.init(name: "Roboto-Regular", size: size)!
    }
    class func blackFont(size:CGFloat)->UIFont{
        return UIFont.init(name: "Roboto-Black", size: size)!
    }
}
