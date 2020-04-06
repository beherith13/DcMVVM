//
//  CoordinatorInstance+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public extension CoordinatorInstance where T.Params == Void {
    func start() {
        start(with: ())
    }
}
