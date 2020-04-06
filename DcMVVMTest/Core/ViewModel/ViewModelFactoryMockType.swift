//
//  ViewModelFactoryMockType.swift
//  DcMVVMTest
//
//  Created by Siarhei Bykau on 10.01.20.
//

import Foundation
import DcMVVM

public protocol ViewModelFactoryMockType {
    associatedtype ViewModel: ViewModelType
    
    typealias Events = ViewModel.Events
    typealias Params = ViewModel.Params
    typealias Terminatable = ViewModel.Terminatable

    func events(with params: Params) -> Events
    // TODO: RxVariant with disposeBag implementation
    func dispose(_ terminatables: [Terminatable])
}

public extension ViewModelFactoryMockType {
    func factory() -> ViewModel.Factory {
        return ViewModel.mockFactory(events: events(with:), terminator: dispose)
    }
}
