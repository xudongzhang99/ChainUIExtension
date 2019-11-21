//
//  UIView+Extension.swift
//  Pods
//
//  Created by xudongzhang on 2019/11/21.
//

import UIKit
import QuartzCore

public extension UIView {
    @discardableResult
    func addSubViews(_ views: UIView...) -> Self {
       views.forEach { addSubview($0) }
       return self
    }
    
    var vc: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }

    @discardableResult
    func corner(_ cornerRadius: Float) -> Self {
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.masksToBounds = true
        return self
    }

    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    func backgroundColor(_ hex: Int) -> Self {
        backgroundColor = UIColor.hex(hex)
        return self
    }

    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

}

extension UIView: ChainUIExtensionCompatible {}

public extension CUE where Base: UIView {
    
   
    
    func radius(radius: CGFloat, corner: UIRectCorner) -> Self  {
        if #available(iOS 11.0, *) {
            base.layer.cornerRadius = radius
            var mask = CACornerMask()
            if corner.contains(.topLeft) {
                mask.insert(.layerMinXMinYCorner)
            }
            if corner.contains(.topRight) {
                mask.insert(.layerMaxXMinYCorner)
            }
            if corner.contains(.bottomLeft) {
                mask.insert(.layerMinXMaxYCorner)
            }
            if corner.contains(.bottomRight) {
                mask.insert(.layerMaxXMaxYCorner)
            }
            base.layer.maskedCorners = mask
            base.layer.masksToBounds = true
        } else {
            var rect = base.bounds
            
            if rect.width < radius || rect.height < radius {
                rect = CGRect.init(x: 0, y: 0, width: radius * 2, height: radius * 2)
            }
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
            let maskLyer = CAShapeLayer()
            maskLyer.frame = base.bounds
            maskLyer.path = path.cgPath
            base.layer.mask = maskLyer
        }
        return self
    }
    
    
    
}



public extension CUE where Base : UIView {
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
    var centerX: CGFloat {
        get { return base.center.x }
        set(newValue) {
            var tc: CGPoint = base.center
            tc.x            = newValue
            base.center          = tc
        }
    }
    var centerY: CGFloat {
        get { return base.center.y }
        set(newValue) {
            var tc: CGPoint = base.center
            tc.y            = newValue
            base.center          = tc;
        }
    }
    var center: CGPoint {
        get { return base.center }
        set(newValue) {
            var tc: CGPoint = base.center
            tc              = newValue
            base.center          = tc
        }
    }
    /// - Attention: try清除所有subviews，考虑多线程，故返回bool标记
    func clear() -> Bool {
        for v in base.subviews {
            v.removeFromSuperview()
        }
        return base.subviews.count == 0
    }

    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: base.bounds)
            return renderer.image { rendererContext in
                base.layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(base.bounds.size, true, 0)
            guard let ctx = UIGraphicsGetCurrentContext() else {
                return nil
            }
            base.layer.render(in: ctx)
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resultImage
        }
    }
}

fileprivate struct TapKeys {
    static var tapActionKey = "cue_tap_action_key"
   
}



/// - Attention: 给任意view添加 tap，先写上，如果有，再删
public extension CUE where Base : UIView {
    
    func addTap(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, action block: @escaping  () -> ()) -> Self {
        addGesture(configGesture: { (tap: UITapGestureRecognizer) in
            tap.numberOfTouchesRequired = numberOfTouchesRequired
            tap.numberOfTapsRequired = numberOfTapsRequired
        }, action: block)
    }
        
    
    
    func addGesture<Gesture>(configGesture:(Gesture) -> Void, action block: @escaping  () -> ()) -> Self  where Gesture: UIGestureRecognizer{
        base.isUserInteractionEnabled = true
        let tap = Gesture(target: base, action: #selector(UITapGestureRecognizer.onTap(_:)))
        base.addGestureRecognizer(tap)
        objc_setAssociatedObject(tap, &TapKeys.tapActionKey, block, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
}



fileprivate extension UIGestureRecognizer {
    @objc func onTap(_ tap: UITapGestureRecognizer) {
        guard let action = objc_getAssociatedObject(tap, &TapKeys.tapActionKey) as? (() -> ())  else {
            return
        }
        action()
    }
}
///// - Important: 给任意view画边框
//public extension UIView {
//    /// 矩形框
//    struct SideRect: OptionSet {
//        public static let l = SideRect(rawValue: 1 << 0)
//        public static let t = SideRect(rawValue: 1 << 1)
//        public static let r = SideRect(rawValue: 1 << 2)
//        public static let b = SideRect(rawValue: 1 << 3)
//        public static let all: SideRect = [.t, .r, .l, .b]
//        public let rawValue: Int
//        public init(rawValue: Int) {
//            self.rawValue = rawValue
//        }
//    }
//    /// 虚线rect框
//    func addDashRectBorder(strokeColor: UIColor, lineW: CGFloat = 1, lineLength: Int = 2, lineSpacing: Int = 3, sideRect: SideRect) {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.bounds = bounds
//        shapeLayer.anchorPoint = CGPoint.zero
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = strokeColor.cgColor
//        shapeLayer.lineWidth = lineW
////        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
//        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]
//        let path = CGMutablePath()
//        if sideRect.contains(.l) {
//            path.move(to: CGPoint(x: 0, y: layer.bounds.height))
//            path.addLine(to: CGPoint.zero)
//        }
//        if sideRect.contains(.t) {
//            path.move(to: CGPoint.zero)
//            path.addLine(to: CGPoint(x: layer.bounds.width, y: 0))
//        }
//        if sideRect.contains(.r) {
//            path.move(to: CGPoint(x: layer.bounds.width, y: 0))
//            path.addLine(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
//        }
//        if sideRect.contains(.b) {
//            path.move(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
//            path.addLine(to: CGPoint(x: 0, y: layer.bounds.height))
//        }
//        shapeLayer.path = path
//        layer.addSublayer(shapeLayer)
//    }
//
//    /// 实线rect框
//    func addSolidRectBorder(strokeColor: UIColor, lineW: CGFloat = 1, sideRect: SideRect) {
//        if sideRect == SideRect.all {
//            layer.borderWidth = lineW
//            layer.borderColor = strokeColor.cgColor
//        } else {
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.bounds = bounds
//            shapeLayer.anchorPoint = CGPoint.zero
//            shapeLayer.fillColor = UIColor.clear.cgColor
//            shapeLayer.strokeColor = strokeColor.cgColor
//            shapeLayer.lineWidth = lineW
////            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
//            let path = CGMutablePath()
//            if sideRect.contains(.l) {
//                path.move(to: CGPoint(x: 0, y: layer.bounds.height))
//                path.addLine(to: CGPoint.zero)
//            }
//            if sideRect.contains(.t) {
//                path.move(to: CGPoint.zero)
//                path.addLine(to: CGPoint(x: layer.bounds.width, y: 0))
//            }
//            if sideRect.contains(.r) {
//                path.move(to: CGPoint(x: layer.bounds.width, y: 0))
//                path.addLine(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
//            }
//            if sideRect.contains(.b) {
//                path.move(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
//                path.addLine(to: CGPoint(x: 0, y: layer.bounds.height))
//            }
//            shapeLayer.path = path
//            layer.addSublayer(shapeLayer)
//        }
//    }
//}
/// - Important: 扩充Button响应区
//public class HitTestButton: ActionButton {
//    private struct HitTestButtonKey {
//        static var key = "hittest_button_key"
//    }
//    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        if self.hitTestEdgeInsets! == .zero || !self.isEnabled || self.isHidden {
//            return super.point(inside: point, with: event)
//        }
//        let hitFrame = self.bounds.inset(by: self.hitTestEdgeInsets!)
//        return hitFrame.contains(point)
//    }
//    public var hitTestEdgeInsets: UIEdgeInsets? {
//        get {
//            if let value = objc_getAssociatedObject(self, &HitTestButtonKey.key) {
//                return value as? UIEdgeInsets
//            }
//            return .zero
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &HitTestButtonKey.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}

