//
//  CoordinatorType+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension CoordinatorType {
    static func wrap(_ handler: @escaping (Context) -> Void, with context: Context) -> () -> Void {
        return {
            handler(context)
        }
    }
}

