//
//  UIControl+DSL.swift
//  SwiftBaseLib
//
//  Created by 0314 on 2019/5/10.
//

import Foundation
import UIKit
extension UIControl {
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isSelected: Bool) -> Self {
        self.isHighlighted = isSelected
        return self
    }
    @discardableResult
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
    @discardableResult
    func add(_ target: Any?, action: Selector, events: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: action, for: events)
        return self
    }
    @discardableResult
    func remove(_ target: Any?, action: Selector, events: UIControl.Event = .touchUpInside) -> Self {
        self.removeTarget(target, action: action, for: events)
        return self
    }
}
