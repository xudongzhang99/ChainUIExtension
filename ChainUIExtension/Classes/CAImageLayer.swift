//
//  CAImageLayer.swift
//  SwiftBaseLib
//
//  Created by ming on 2019/7/11.
//

import Foundation

public class CAImageLayer: CALayer {
    override init() {
        super.init()
        self.contentsScale = UIScreen.main.scale
    }
    convenience init(image: UIImage?) {
        self.init()
        self.image = image
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cgImage: CGImage? {
        didSet {
            self.contents = cgImage
        }
    }
    
    var image: UIImage? {
        set {
            self.cgImage = newValue?.cgImage
        }
        get {
            if let i = cgImage {
                return  UIImage.init(cgImage: i)
            }
            return nil
        }
    }
}
public extension CAImageLayer {
    @discardableResult
    func image(_ image: UIImage) -> Self {
        self.image = image
        return self
    }
    @discardableResult
    func cgImage(_ image: CGImage) -> Self {
        self.cgImage = image
        return self
    }
    
    @discardableResult
    func image(in bundle: Bundle? = nil, _ imageName: String) -> Self {
        
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        self.image = image
        return self
    }
    
    @discardableResult
    func image(for aClass: AnyClass, _ imageName: String) -> Self {
        let image = UIImage(named: imageName, in: Bundle(for: aClass), compatibleWith: nil)
        self.image = image
        return self
    }
    
    
    @discardableResult
    func image(_ color: UIColor) -> Self {
        let image = UIImage.imageWithColor(color)
        self.image = image
        return self
    }

}
