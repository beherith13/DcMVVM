//
//  ViewModelMockType+Void.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public extension ViewModelMockType where ViewModel.Dependencies == Void {
    typealias VoidDependencies = VoidViewModelDependenciesMock<ViewModel>
}
