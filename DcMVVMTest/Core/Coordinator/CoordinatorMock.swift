//
//  CoordinatorMock.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public class CoordinatorMock<T: CoordinatorType> {
    public var initCalled: (context: T.Context, dependencies: T.Dependencies)?
    public var startCalled: T.Params?

    fileprivate init() { }
    
    public func factory() -> T.Factory {
        return T.mockFactory(
            instantiate: {
                self.initCalled = ($0, $1)
            },
            start: {
                self.startCalled = $0
            }
        )
    }
}

public extension CoordinatorType {
    static func mock() -> CoordinatorMock<Self> {
        return CoordinatorMock()
    }
}
