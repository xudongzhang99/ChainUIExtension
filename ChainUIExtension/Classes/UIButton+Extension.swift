//
//  UIButton+DSL.swift
//  Alamofire
//
//  Created by xudongzhang on 2018/9/13.
//

import Foundation
public extension CUI where Base :UIButton {
    
    @discardableResult
    func title(_ text: String?, _ state: UIControl.State = .normal) -> Self {
        base.setTitle(text, for: state)
        return self
    }

    @discardableResult
    func color(_ color: UIColor?, _ state: UIControl.State = .normal) -> Self {
        base.setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func font(_ font: UIFont?) -> Self {
        base.titleLabel?.font = font
        return self
    }

    @discardableResult
    func font(_ fontSize: Float) -> Self {
        base.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }

    @discardableResult
    func font(_ fontSize: Int) -> Self {
        base.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }
    
    @discardableResult
    func boldFont(_ fontSize: Float) -> Self {
        base.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }
    
    @discardableResult
    func boldFont(_ fontSize: Int) -> Self {
        base.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        base.setImage(image, for: state)
        return self
    }

    @discardableResult
    func image(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        base.setImage(image, for: state)
        return self
    }

    @discardableResult
    func image(in bundle: Bundle, name imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        base.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func image(for aClass: AnyClass, name imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: Bundle(for: aClass), compatibleWith: nil)
        base.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func image(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        base.setImage(image, for: state)
        return self
    }
    

    @discardableResult
    func image(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage.imageWithColor(color)
        base.setImage(image, for: state)
        return self
    }

    @discardableResult
    func bgImage(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        base.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func bgImage(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        base.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func bgImage(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        base.setBackgroundImage(image, for: state)
        return self
    }

    @discardableResult
    func bgImage(for aClass: AnyClass, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: Bundle(for: aClass), compatibleWith: nil)
        base.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func bgImage(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage.imageWithColor(color)
        base.setBackgroundImage(image, for: state)
        return self
    }

   

    @discardableResult
    func textColor(_ color: UIColor?, state: UIControl.State = .normal) -> Self {
        base.setTitleColor(color, for: state)
        return self
    }
}


