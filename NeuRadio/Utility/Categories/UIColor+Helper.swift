//
//  UIColor+Helper.swift
//  Neu Radio
//
//  Created by Minh Vo on 6/3/17.
//  Copyright © 2017 minhvo. All rights reserved.
//

import UIKit

extension UIColor {
    //Red #e62117
    static let red_Youtube = UIColor(red: 230.0/255.0, green: 33.0/255.0, blue: 22.0/255.0, alpha: 1.0)
}

extension UIFont {    
    public static func RobotoMediumFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: fontSize)!
    }
    static func RobotoThinFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: fontSize)!
    }
    static func RobotoLightFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: fontSize)!
    }
    static func RobotoBoldFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: fontSize)!
    }
    static func RobotoBlackFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: fontSize)!
    }
}
