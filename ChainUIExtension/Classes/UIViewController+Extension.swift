//
//  UIViewController+Extension.swift
//  Pods
//
//  Created by xudongzhang on 2019/11/21.
//

import UIKit


public extension CUI where Base :UIViewController {
    static func top() -> UIViewController? {
        var rootVC: UIViewController?
        if let window = UIApplication.shared.delegate?.window {
            rootVC = window?.rootViewController
        } else {
            rootVC = UIApplication.shared.keyWindow?.rootViewController
        }
        return top(rootVC: rootVC)
    }

    static func top(window: UIWindow?) -> UIViewController? {
        return top(rootVC: window?.rootViewController ?? UIApplication.shared.keyWindow?.rootViewController)
    }

    static func top(rootVC: UIViewController?) -> UIViewController? {
        if let presentedVC = rootVC?.presentedViewController {
            return top(rootVC: presentedVC)
        }

        if let nav = rootVC as? UINavigationController,
            let lastVC = nav.viewControllers.last {
            return top(rootVC: lastVC)
        }

        if let tab = rootVC as? UITabBarController,
            let selectedVC = tab.selectedViewController {
            return top(rootVC: selectedVC)
        }
        return rootVC
    }
}
