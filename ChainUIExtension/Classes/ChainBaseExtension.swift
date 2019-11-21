//
//  ChainBaseExtension.swift
//  Pods
//
//  Created by xudongzhang on 2019/11/21.
//

import Foundation
public protocol ChainUIExtensionCompatible {
    associatedtype CompatibleType
    var cue: Self.CompatibleType { get }
}

public extension ChainUIExtensionCompatible {
    var cue: CUE<Self> {
        return CUE(self)
    }
}

public final class CUE<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}
