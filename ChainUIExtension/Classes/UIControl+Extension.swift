//
//  UIControl+DSL.swift
//  SwiftBaseLib
//
//  Created by 0314 on 2019/5/10.
//

import Foundation
import UIKit
public extension CUI where Base : UIControl {
    
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        base.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        base.isSelected = isSelected
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isSelected: Bool) -> Self {
        base.isHighlighted = isSelected
        return self
    }
    
    @discardableResult
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        base.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    
    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        base.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
    
    @discardableResult
    func add(_ target: Any?, action: Selector, events: UIControl.Event = .touchUpInside) -> Self {
        base.addTarget(target, action: action, for: events)
        return self
    }
    
    @discardableResult
    func remove(_ target: Any?, action: Selector, events: UIControl.Event = .touchUpInside) -> Self {
        base.removeTarget(target, action: action, for: events)
        return self
    }
    
    @discardableResult
    func addAction(_ action: @escaping (UIControl) -> Void) -> Self {
        base.cui_action_block = action
        add(self, action: #selector(UIControl.cui_btn_action))
        return self
    }
}

fileprivate  extension UIControl {
    private static var cui_action_block_key = "cui_action_block_key"
    
    @objc func cui_btn_action() {
        cui_action_block?(self)
    }
    
    var cui_action_block: ((UIControl) -> ())? {
        get {
            return objc_getAssociatedObject(self, &UIControl.cui_action_block_key) as? ((UIControl) -> ())
        }
        set {
            guard let action = newValue else { return }
            objc_setAssociatedObject(self, &UIControl.cui_action_block_key, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
