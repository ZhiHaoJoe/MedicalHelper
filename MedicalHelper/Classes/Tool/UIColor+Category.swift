//
//  UIColor+Category.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

extension UIColor{
    /**
     16进制转UIColor
     
     - parameter hex: 16进制颜色字符串
     
     - returns: 转换后的颜色
     */
    class func colorWithHexString(hex: String) -> UIColor {
        return colorWithHexString(hex, alpha: 1.0)
    }
    
    /**
     16进制转UIColor，
     
     - parameter hex:   16进制颜色字符串
     - parameter alpha: 透明度
     
     - returns: 转换后的颜色
     */
    class func ColorHexWithAlpha(hex: String, alpha: CGFloat) -> UIColor {
        return colorWithHexString(hex, alpha: alpha)
    }
    
    class func colorWithHexString(color: String, alpha: CGFloat) -> UIColor{
        /** 如果传入的字符串为空 */
        if color.isEmpty {
            return UIColor.clearColor()
        }
        
        /** 传进来的值。 去掉了可能包含的空格、特殊字符， 并且全部转换为大写 */
        var hHex = (color.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())).uppercaseString
        
        /** 如果处理过后的字符串少于6位 */
        if hHex.characters.count < 6 {
            return UIColor.clearColor()
        }
        
        /** 开头是用0x开始的 */
        if hHex.hasPrefix("0X") {
            hHex = (hHex as NSString).substringFromIndex(2)
        }
        /** 开头是以＃开头的 */
        if hHex.hasPrefix("#") {
            hHex = (hHex as NSString).substringFromIndex(1)
        }
        /** 开头是以＃＃开始的 */
        if hHex.hasPrefix("##") {
            hHex = (hHex as NSString).substringFromIndex(2)
        }
        
        /** 截取出来的有效长度是6位， 所以不是6位的直接返回 */
        if hHex.characters.count != 6 {
            return UIColor.clearColor()
        }
        
        /** R G B */
        var range = NSMakeRange(0, 2)
        
        /** R */
        let rHex = (hHex as NSString).substringWithRange(range)
        
        /** G */
        range.location = 2
        let gHex = (hHex as NSString).substringWithRange(range)
        
        /** B */
        range.location = 4
        let bHex = (hHex as NSString).substringWithRange(range)
        
        /** 类型转换 */
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        
        NSScanner(string: rHex).scanHexInt(&r)
        NSScanner(string: gHex).scanHexInt(&g)
        NSScanner(string: bHex).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
