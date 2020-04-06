//
//  ViewModelFactory.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation

public struct ViewModelFactory<T: ViewModelType> {
    public typealias Handler = (T.Params, T.Dependencies, @escaping T.EventsBinder) -> T.Instance
    private let handler: Handler
    
    public init(handler: @escaping Handler) {
        self.handler = handler
    }

    public func instance(with params: T.Params, dependencies: T.Dependencies, binder: @escaping T.EventsBinder) -> T.Instance {
        return handler(params, dependencies, binder)
    }
}
