//
//  CoordinatorType+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension CoordinatorType where Dependencies == Void {
    static func instance(with context: Context, factories: FactoryPair) -> Instance {
        return instance(with: context, dependencies: (), factories: factories)
    }
    
    static func instance(with context: Context) -> Instance {
        return instance(with: context, dependencies: ())
    }

}

