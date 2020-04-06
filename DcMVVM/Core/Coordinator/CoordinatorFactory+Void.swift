//
//  CoordinatorFactory+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension CoordinatorFactory where T.Dependencies == Void {
    func instance(with context: T.Context) -> T.Instance {
        instance(with: context, dependencies: ())
    }
}

public extension CoordinatorFactory where T.Context == Void {
    func instance(dependencies: T.Dependencies) -> T.Instance {
        instance(with: (), dependencies: dependencies)
    }
}

public extension CoordinatorFactory where  T.Context == Void, T.Dependencies == Void {
    func instance() -> T.Instance {
        instance(with: (), dependencies: ())
    }
}
