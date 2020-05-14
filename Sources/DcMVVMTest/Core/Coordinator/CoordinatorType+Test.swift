//
//  CoordinatorType+Test.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public extension CoordinatorType {

    static func mockFactory(
        instantiate: @escaping (Context, Dependencies) -> Void,
        start: @escaping (Params, @escaping Completion) -> Void
    ) -> Factory {
        return Factory { context, dependencies in
            instantiate(context, dependencies)
            
            return CoordinatorInstance { params, completion in
                start(params, completion)
            }
        }
    }
}
