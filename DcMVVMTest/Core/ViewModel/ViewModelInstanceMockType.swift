//
//  ViewModelInstanceMockType.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public protocol ViewModelInstanceMockType {
    associatedtype ViewModel: ViewModelType
    typealias Input = ViewModel.Input
    typealias Output = ViewModel.Output

    func output(for input: Input) -> Output
}

public extension ViewModelInstanceMockType {
    func instance() -> ViewModel.Instance {
        return ViewModel.mockInstance(output: output(for:))
    }
}
