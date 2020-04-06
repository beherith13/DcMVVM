//
//  CoordinatorInstance.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public struct CoordinatorInstance<T: CoordinatorType> {
    public typealias Handler = (T.Params) -> Void
    private let handler: Handler
    
    public init(handler: @escaping Handler) {
        self.handler = handler
    }

    public func start(with params: T.Params) {
        handler(params)
    }
}
