//
//  ChainBaseExtension.swift
//  Pods
//
//  Created by xudongzhang on 2019/11/21.
//

import Foundation
public protocol ChainUIExtensionCompatible {
    associatedtype CompatibleType
    var cui: Self.CompatibleType { get }
}

public extension ChainUIExtensionCompatible {
    var cui: CUI<Self> {
        return CUI(self)
    }
}

public final class CUI<Base> {
    public let base: Base
    public var end: Base {
        return base
    }
    public init(_ base: Base) {
        self.base = base
    }
}

extension UIView: ChainUIExtensionCompatible {}
