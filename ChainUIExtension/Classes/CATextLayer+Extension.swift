//
//  CATextLayer+DSL.swift
//  SwiftBaseLib
//
//  Created by 0314 on 2019/5/7.
//

import Foundation
import UIKit
public extension CUI where Base :CATextLayer {
    
    @discardableResult
    func text(_ text: String) -> Self {
        base.string = text
        return self
    }
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        base.string = attributedText
        return self
    }
    
    
    /// 自动换行，默认NO
    @discardableResult
    func isWrapped(_ isWrapped: Bool) -> Self {
        base.isWrapped = isWrapped
        return self
    }
    
    
    /// 当文本显示不全时的裁剪方式
    ///
    /// - Parameter truncationMode: 裁剪方式
    /// none 不剪裁，默认
    /// start 剪裁开始部分
    /// end 剪裁结束部分
    /// middle 剪裁中间部分;
    @discardableResult
    func truncationMode(_ truncationMode: CATextLayerTruncationMode) -> Self {
        base.truncationMode = truncationMode as String
        return self
    }
    
//    @discardableResult
//    func alignment(_ alignment: NSTextAlignment) -> Self {
//        switch alignment {
//        case .left:
//            base.alignmentMode = .left
//        case .right:
//            base.alignmentMode = .right
//        case .center:
//            base.alignmentMode = .center
//        case .natural:
//            base.alignmentMode = .natural
//        case .justified:
//            base.alignmentMode = .justified
//        default:
//            base.alignmentMode = .left
//        }
//        return self
//    }
    
    //
    @discardableResult
    func color(_ color: UIColor) -> Self {
        base.foregroundColor = color.cgColor
        return self
    }
    @discardableResult
    func color(_ hex: Int) -> Self {
        base.foregroundColor = UIColor.hex(hex).cgColor
        return self
    }
    
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        base.fontSize = fontSize
        if #available(iOS 9.0, *) {
            base.font = CTFontCreateWithName("PingFangSC-Regular" as CFString, fontSize, nil)
        }
        base.contentsScale = UIScreen.main.scale
        return self
    }
    @discardableResult
    func font(_ font: UIFont) -> Self {
        base.font =  CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
        base.contentsScale = UIScreen.main.scale
        return self
    }
    @discardableResult
    func boldFont(_ boldfontSize: CGFloat) -> Self {
        base.fontSize = boldfontSize
        if #available(iOS 9.0, *) {
            base.font = CTFontCreateWithName("PingFangSC-Medium" as CFString, boldfontSize, nil)
        } else {
            base.font = CTFontCreateWithName("Helvetica-bold" as CFString, boldfontSize, nil)
        }
        base.contentsScale = UIScreen.main.scale
        return self
    }

    
    
}
