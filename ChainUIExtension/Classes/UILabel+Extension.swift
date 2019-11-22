//
//  UILabel+DSL.swift
//  Alamofire
//
//  Created by xudongzhang on 2018/9/13.
//

import Foundation

public extension CUI where Base: UILabel {
    @discardableResult
    func text(_ text: String) -> Self {
        base.text = text
        return self
    }

    @discardableResult
    func line(_ number: Int) -> Self {
        base.numberOfLines = number
        return self
    }

    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        base.textAlignment = alignment
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        base.attributedText = attributedText
        return self
    }

    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        base.textAlignment = alignment
        return self
    }

    @discardableResult
    func color(_ color: UIColor) -> Self {
        base.textColor = color
        return self
    }
    @discardableResult
    func color(_ hex: Int) -> Self {
        base.textColor = UIColor.hex(hex)
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        base.font = font
        return self
    }

    @discardableResult
    func font(_ fontSize: Float) -> Self {
        base.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }

    @discardableResult
    func font(_ fontSize: Int) -> Self {
        base.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }
    
    @discardableResult
    func boldFont(_ fontSize: Float) -> Self {
        base.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        return self
    }
    
    @discardableResult
    func boldFont(_ fontSize: Int) -> Self {
        base.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        return self
    }
    
    @discardableResult
    func font(name: String, size: CGFloat) -> Self {
        base.font = UIFont(name: name, size: size)
        return self
    }
}
