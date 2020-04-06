//
//  ViewModelType+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension ViewModelType where Params == Void {
    static func instance(dependencies: Dependencies, binder: @escaping EventsBinder) -> Instance {
        return instance(with: (), dependencies: dependencies, binder: binder)
    }
}

public extension ViewModelType where Dependencies == Void {
    static func instance(with params: Params, binder: @escaping EventsBinder) -> Instance {
        return instance(with: params, dependencies: (), binder: binder)
    }
}

public extension ViewModelType where Params == Void, Dependencies == Void {
    static func instance(binder: @escaping EventsBinder) -> Instance {
        return instance(with: (), dependencies: (), binder: binder)
    }
}

public extension ViewModelType where Events == Void {
    static func instance(with params: Params, dependencies: Dependencies) -> Instance {
        return instance(with: params, dependencies: dependencies, binder: { _ in [] })
    }
}

public extension ViewModelType where Events == Void, Params == Void {
    static func instance(dependencies: Dependencies) -> Instance {
        return instance(with: (), dependencies: dependencies, binder: { _ in [] })
    }
}

public extension ViewModelType where Events == Void, Dependencies == Void {
    static func instance(with params: Params) -> Instance {
        return instance(with: params, dependencies: (), binder: { _ in [] })
    }
}

public extension ViewModelType where Events == Void, Params == Void, Dependencies == Void {
    static func instance() -> Instance {
        return instance(with: (), dependencies: (), binder: { _ in [] })
    }
}

