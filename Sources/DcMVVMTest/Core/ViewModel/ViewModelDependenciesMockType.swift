//
//  ViewModelDependenciesMockType.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public protocol ViewModelDependenciesMockType {
    associatedtype ViewModel: ViewModelType
    
    typealias Dependencies = ViewModel.Dependencies

    func dependencies() -> Dependencies
}
