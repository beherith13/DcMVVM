//
//  ViewModelInstance.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation

public struct ViewModelInstance<T: ViewModelType> {
    public typealias Handler = (T.Input, T.OutputBinder) -> [T.Terminatable]
    private let handler: Handler
    
    public init(handler: @escaping Handler) {
        self.handler = handler
    }
    
    public func bind(input: T.Input, binder: T.OutputBinder) -> [T.Terminatable] {
        return handler(input, binder)
    }
}
