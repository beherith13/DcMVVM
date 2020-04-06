//
//  CoordinatorFactory.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public struct CoordinatorFactory<T: CoordinatorType> {
    public typealias Handler = (T.Context, T.Dependencies) -> T.Instance
    private let handler: Handler
    
    public init(handler: @escaping Handler) {
        self.handler = handler
    }

    public func instance(with context: T.Context, dependencies: T.Dependencies) -> T.Instance {
        return handler(context, dependencies)
    }
}
