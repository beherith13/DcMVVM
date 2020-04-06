//
//  ViewModelDependenciesMockType+Void.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public extension ViewModelDependenciesMockType where ViewModel.Dependencies == Void {    
    func dependencies() -> ViewModel.Dependencies {
        return ()
    }
}

public struct VoidViewModelDependenciesMock<ViewModel: ViewModelType>: ViewModelDependenciesMockType where ViewModel.Dependencies == Void {
    public typealias ViewModel = ViewModel
}

