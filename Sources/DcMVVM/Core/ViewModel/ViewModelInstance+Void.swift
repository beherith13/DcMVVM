//
//  ViewModelInstance+Void.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation

public extension ViewModelInstance where T.Input == Void {
    func bind(binder: T.OutputBinder) -> [T.Terminatable] {
        return bind(input: (), binder: binder)
    }
}
