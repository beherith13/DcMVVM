//
//  ViewModelType+Test.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public extension ViewModelType {
    typealias OutputMock = (Input) -> Output
    typealias EventsMock = (Params) -> Events
    typealias Terminator = ([Terminatable]) -> Void

    static func mockInstance(output mock: @escaping OutputMock) -> Instance {
        return Instance { input, binder in
            let output = mock(input)            
            return binder(output)
        }
    }

    static func mockFactory(events mock: @escaping EventsMock, terminator: @escaping Terminator) -> Factory {
        return Factory { params, _, binder in
            mockInstance(events: mock, params: params, binder: binder, terminator: terminator)
        }
    }
    
    private static func mockInstance(
        events mock: @escaping EventsMock,
        params: Params,
        binder: @escaping EventsBinder,
        terminator: @escaping Terminator
    ) -> Instance {
        let events = mock(params)
        terminator(binder(events))
        return Instance { _, _ in [] }
    }
}
