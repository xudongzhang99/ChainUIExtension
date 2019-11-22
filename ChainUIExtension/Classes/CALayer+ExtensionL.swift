//
//  CALayer+DSL.swift
//  SwiftBaseLib
//
//  Created by ming on 2019/7/11.
//

import Foundation

public extension CUI where Base :CALayer {
    
    @discardableResult
    func corner(_ cornerRadius: CGFloat) -> Self {
        base.cornerRadius = cornerRadius
        base.masksToBounds = true
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        base.backgroundColor = color.cgColor
        return self
    }
    
    @discardableResult
    func backgroundColor(_ hex: Int) -> Self {
        base.backgroundColor = UIColor.hex(hex).cgColor
        return self
    }
    
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        base.frame = frame
        return self
    }
    
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.layer.addSublayer(base)
        return self
    }
    
    @discardableResult
    func addTo(_ superLayer: CALayer) -> Self {
        superLayer.addSublayer(base)
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        base.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        base.borderWidth = width
        return self
    }
    
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        base.borderColor = color.cgColor
        return self
    }
    
    /// 是否开启光栅化
    @discardableResult
    func shouldRasterize(_ rasterize: Bool) -> Self {
        base.shouldRasterize = rasterize
        return self
    }
    
    /// 开启光栅化比例
    @discardableResult
    func rasterizationScale(_ scale: CGFloat) -> Self {
        base.rasterizationScale = scale
        base.shouldRasterize = true
        return self
    }
    
    /// 阴影颜色
    @discardableResult
    func shadowColor(_ color: UIColor) -> Self {
        base.shadowColor = color.cgColor
        return self
    }
    
    /// 阴影的透明度
    @discardableResult
    func shadowOpacity(_ opacity: Float) -> Self {
        base.shadowOpacity = opacity
        return self
    }
    
    /// 阴影偏移量
    @discardableResult
    func shadowOffset(_ offset: CGSize) -> Self {
        base.shadowOffset = offset
        return self
    }
    /// 阴影圆角
    @discardableResult
    func shadowRadius(_ radius: CGFloat) -> Self {
        base.shadowRadius = radius
        return self
    }
    /// 阴影偏移量
    @discardableResult
    func shadowPath(_ path: CGPath) -> Self {
        base.shadowPath = path
        return self
    }
    
}

/// - Important: UI conveniently
public extension CUI where Base : CALayer {
    var x: CGFloat {
        get { return base.frame.origin.x }
        set(newValue) {
            var tf: CGRect = base.frame
            tf.origin.x    = newValue
            base.frame          = tf
        }
    }
    var y: CGFloat {
        get { return base.frame.origin.y }
        set(newValue) {
            var tf: CGRect = base.frame
            tf.origin.y    = newValue
            base.frame          = tf
        }
    }
    var height: CGFloat {
        get { return base.frame.size.height }
        set(newValue) {
            var tf: CGRect = base.frame
            tf.size.height = newValue
            base.frame          = tf
        }
    }
    var width: CGFloat {
        get { return base.frame.size.width }
        set(newValue) {
            var tf: CGRect = base.frame
            tf.size.width  = newValue
            base.frame = tf
        }
    }
    var size: CGSize {
        get { return base.frame.size }
        set(newValue) {
            var tf: CGRect = base.frame
            tf.size        = newValue
            base.frame          = tf
        }
    }
    /// - Attention: try清除所有subviews，考虑多线程，故返回bool标记
    func clear() -> Bool {
        for v in base.sublayers ?? [] {
            v.removeFromSuperlayer()
        }
        return base.sublayers?.count == 0
    }
    
    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: base.bounds)
            return renderer.image { rendererContext in
                base.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(base.bounds.size, true, 0)
            guard let ctx = UIGraphicsGetCurrentContext() else {
                return nil
            }
            base.render(in: ctx)
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resultImage
        }
    }
}
