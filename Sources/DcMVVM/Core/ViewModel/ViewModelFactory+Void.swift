//
//  ViewModelFactory+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation

public extension ViewModelFactory where T.Params == Void {
    func instance(dependencies: T.Dependencies, binder: @escaping T.EventsBinder) -> T.Instance {
        return instance(with: (), dependencies: dependencies, binder: binder)
    }
}

public extension ViewModelFactory where T.Dependencies == Void {
    func instance(params: T.Params, binder: @escaping T.EventsBinder) -> T.Instance {
        return instance(with: params, dependencies: (), binder: binder)
    }
}

public extension ViewModelFactory where T.Params == Void, T.Dependencies == Void {
    func instance(binder: @escaping T.EventsBinder) -> T.Instance {
        return instance(with: (), dependencies: (), binder: binder)
    }
}

public extension ViewModelFactory where T.Events == Void {
    func instance(with params: T.Params, dependencies: T.Dependencies) -> T.Instance {
        return instance(with: params, dependencies: dependencies, binder: { _ in [] })
    }
}

public extension ViewModelFactory where T.Events == Void, T.Params == Void {
    func instance(dependencies: T.Dependencies) -> T.Instance {
        return instance(with: (), dependencies: dependencies, binder: { _ in [] })
    }
}

public extension ViewModelFactory where T.Events == Void, T.Dependencies == Void {
    func instance(with params: T.Params) -> T.Instance {
        return instance(with: params, dependencies: (), binder: { _ in [] })
    }
}

public extension ViewModelFactory where T.Events == Void, T.Params == Void, T.Dependencies == Void {
    func instance() -> T.Instance {
        return instance(with: (), dependencies: (), binder: { _ in [] })
    }
}
