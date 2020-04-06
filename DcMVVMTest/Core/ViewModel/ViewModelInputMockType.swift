//
//  ViewModelInputMockType.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public protocol ViewModelInputMockType {
    associatedtype ViewModel: ViewModelType
    
    associatedtype Input = ViewModel.Input

    func input() -> Input
}
