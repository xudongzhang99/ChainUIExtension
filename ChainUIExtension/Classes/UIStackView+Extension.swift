//
//  UIStackView+DSL.swift
//  SwiftBaseLib
//
//  Created by xudongzhang on 2019/8/30.
//

import UIKit

@available(iOS 9.0, *)
public extension CUI where Base :UIStackView {
    
    @discardableResult
    func set(baselineRelative arrangement: Bool) -> Self {
        base.isBaselineRelativeArrangement = arrangement
        return self
    }
    
    @discardableResult
    func set(layoutMarginsRelative arrangement: Bool) -> Self {
        base.isLayoutMarginsRelativeArrangement = arrangement
        return self
    }
    
    @discardableResult
    func set(axis: NSLayoutConstraint.Axis) -> Self {
        base.axis = axis
        return self
    }
    
   
    @discardableResult
    func set(distribution: UIStackView.Distribution) -> Self {
        base.distribution = distribution
        return self
    }
    
   
    @discardableResult
    func set(alignment: UIStackView.Alignment) -> Self {
        base.alignment = alignment
        return self
    }
    
    @discardableResult
    func set(spacing: CGFloat) -> Self {
        base.spacing = spacing
        return self
    }

    @discardableResult
    func addArrangedSubviews(_ items: UIView...) -> Self {
        if items.isEmpty { return self }
        for i in 0..<items.count {
            base.addArrangedSubview(items[i])
        }
        return self
    }
    
   
    
}
