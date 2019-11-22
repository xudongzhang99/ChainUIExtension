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
}
