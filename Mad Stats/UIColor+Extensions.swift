//
//  UIColor+Extensions.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

extension UIColor {

    // Based on https://gist.github.com/arshad/de147c42d7b3063ef7bc
    convenience init(hex: String) {

        var colorString = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString

        if colorString.hasPrefix("#") {
            colorString = (colorString as NSString).substringFromIndex(1)
        }

        guard colorString.characters.count == 6 else {
            self.init(white: 0.5, alpha: 1.0)
            return
        }

        let red: String = (colorString as NSString).substringToIndex(2)
        let green = ((colorString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let blue = ((colorString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
        NSScanner(string: red).scanHexInt(&r)
        NSScanner(string: green).scanHexInt(&g)
        NSScanner(string: blue).scanHexInt(&b)

        self.init(red: CGFloat(r) / CGFloat(255.0), green: CGFloat(g) / CGFloat(255.0), blue: CGFloat(b) / CGFloat(255.0), alpha: CGFloat(1))
    }
}
