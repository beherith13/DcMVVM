//
//  CoordinatorInstance+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension CoordinatorInstance where T.Params == Void, T.Result == Void {
    func start() {
        start(with: (), completion: { })
    }
}

public extension CoordinatorInstance where T.Params == Void {
    func start(completion: @escaping T.Completion) {
        start(with: (), completion: completion)
    }
}

public extension CoordinatorInstance where T.Result == Void {
    func start(with params: T.Params) {
        start(with: params, completion: { })
    }
}
