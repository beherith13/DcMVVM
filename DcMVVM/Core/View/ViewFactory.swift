//
//  ViewFactory.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation

public struct ViewFactory<T: ViewType> {
    public typealias Handler = () -> T.Instance
    private let handler: Handler
    
    public init(handler: @escaping Handler) {
        self.handler = handler
    }

    public func instance() -> T.Instance {
        return handler()
    }
}
