//
//  ViewModelMockType.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public protocol ViewModelMockType {
    associatedtype ViewModel
    
    associatedtype Instance: ViewModelInstanceMockType where Instance.ViewModel == ViewModel
    associatedtype Factory: ViewModelFactoryMockType where Factory.ViewModel == ViewModel
    associatedtype Input: ViewModelInputMockType where Input.ViewModel == ViewModel
    associatedtype Dependencies: ViewModelDependenciesMockType where Dependencies.ViewModel == ViewModel
}
