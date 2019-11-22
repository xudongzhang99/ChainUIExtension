//
//  File.swift
//  SwiftBaseLib
//
//  Created by 0314 on 2019/5/10.
//

import Foundation
public extension CUI where Base :UIScrollView {
    @discardableResult
    func contentOffset(_ offset: CGPoint) -> Self {
        base.contentOffset = offset
        return self
    }
    @discardableResult
    func contentOffset(x: CGFloat, y: CGFloat) -> Self {
        base.contentOffset = CGPoint.init(x: x, y: y)
        return self
    }
    @discardableResult
    func contentSize(width: CGFloat, height: CGFloat) -> Self {
        base.contentSize = CGSize.init(width: width, height: height)
        return self
    }
    @discardableResult
    func contentSize(_ size: CGSize) -> Self {
        base.contentSize = size
        return self
    }
    @discardableResult
    func contentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Self {
        base.contentInset = UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    @discardableResult
    func contentInset(_ inset: UIEdgeInsets) -> Self {
        base.contentInset = inset
        return self
    }
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate) -> Self {
        base.delegate = delegate
        return self
    }
    @discardableResult
    func bounces(_ bounces: Bool) -> Self {
        base.bounces = bounces
        return self
    }
    @discardableResult
    func alwaysBounceVertical(_ bounces: Bool) -> Self {
        base.alwaysBounceVertical = bounces
        return self
    }
    @discardableResult
    func alwaysBounceHorizontal(_ bounces: Bool) -> Self {
        base.alwaysBounceHorizontal = bounces
        return self
    }
    @discardableResult
    func isPagingEnabled(_ enabled: Bool) -> Self {
        base.isPagingEnabled = enabled
        return self
    }
    @discardableResult
    func showsHorizontalScrollIndicator(_ enabled: Bool) -> Self {
        base.showsHorizontalScrollIndicator = enabled
        return self
    }
    @discardableResult
    func showsVerticalScrollIndicator(_ enabled: Bool) -> Self {
        base.showsVerticalScrollIndicator = enabled
        return self
    }
    @discardableResult
    func setContentOffset(_ horizontal: CGFloat, _ vertical: CGFloat, animated: Bool = true) -> Self {
        base.setContentOffset(CGPoint.init(x: horizontal, y: vertical), animated: animated)
        return self
    }
    @discardableResult
    func setContentOffsetX(_ horizontal: CGFloat, animated: Bool = true) -> Self {
        base.setContentOffset(CGPoint.init(x: horizontal, y: base.contentOffset.y), animated: animated)
        return self
    }
    @discardableResult
    func setContentOffsetY( _ vertical: CGFloat, animated: Bool = true) -> Self {
        base.setContentOffset(CGPoint.init(x: base.contentOffset.x, y: vertical), animated: animated)
        return self
    }

}

