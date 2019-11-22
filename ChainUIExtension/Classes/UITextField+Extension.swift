//
//  UITextField+DSL.swift
//  Alamofire
//
//  Created by xudongzhang on 2018/9/13.
//

import Foundation

public extension CUI where Base :UITextField {
    @discardableResult
    func text(_ text: String) -> Self {
        base.text = text
        return self
    }
    @discardableResult
    func attributedText(_ text: NSAttributedString) -> Self {
        base.attributedText = text
        return self
    }
    

    @discardableResult
    func placeholder(_ text: String) -> Self {
        base.placeholder = text
        return self
    }
    @discardableResult
    func attributedPlaceholder(_ text: NSAttributedString) -> Self {
        base.attributedPlaceholder = text
        return self
    }

    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
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
    func delegate(_ delegate: UITextFieldDelegate) -> Self {
        base.delegate = delegate
        return self
    }

}
