//
//  UIImageView+DSL.swift
//  Alamofire
//
//  Created by xudongzhang on 2018/9/13.
//

import Foundation

public extension CUI where Base :UIImageView {
    @discardableResult
    func image(_ image: UIImage?, _: UIControl.State = .normal) -> Self {
        base.image = image
        return self
    }

    @discardableResult
    func image(in bundle: Bundle? = nil, _ imageName: String, _: UIControl.State = .normal) -> Self {
      
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        base.image = image
        return self
    }

    @discardableResult
    func image(for aClass: AnyClass, _ imageName: String, _: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: Bundle(for: aClass), compatibleWith: nil)
        base.image = image
        return self
    }
    
    
    @discardableResult
    func image(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        base.image = image
        return self
    }
    
    @discardableResult
    func image(_ color: UIColor, _: UIControl.State = .normal) -> Self {
        let image = UIImage.imageWithColor(color)
        base.image = image
        return self
    }
}
