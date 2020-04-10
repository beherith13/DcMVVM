//
//  SecondViewModelMock.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import DcMVVMTest
@testable import DcMVVM_Example

enum SecondViewModelMock: ViewModelMockType {
    typealias ViewModel = SecondViewModel
    
    final class Instance: ViewModelInstanceMockType {
        typealias ViewModel = SecondViewModel
        
        let title = BehaviorRelay<String>(value: "title")
        let description = BehaviorRelay<String>(value: "description")
        let buttonTitle = BehaviorRelay<String>(value: "buttonTitle")

        func output(for input: ViewModel.Input) -> ViewModel.Output {
            ViewModel.Output(
                title: title.asDriver(),
                description: description.asDriver(),
                buttonTitle: buttonTitle.asDriver()
            )
        }
    }
    
    final class Factory: ViewModelFactoryMockType {
        typealias ViewModel = SecondViewModel
        
        let disposeBag = DisposeBag()
        let didClose = PublishRelay<FirstModel>()

        func events(with params: FirstModel) -> ViewModel.Events {
            ViewModel.Events(didClose: didClose.asSignal())
        }
        
        func dispose(_ terminatables: [Disposable]) {
            terminatables.disposed(by: disposeBag)
        }
    }
    
    final class Input: ViewModelInputMockType {
        typealias ViewModel = SecondViewModel
        
        let close = PublishRelay<Void>()
        
        func input() -> ViewModel.Input {
            ViewModel.Input(close: close.asObservable())
        }
    }
    
    final class Dependencies: ViewModelDependenciesMockType {
        typealias ViewModel = SecondViewModel
        
        let userDefaults = UserDefaultsMock()
        
        func dependencies() -> ViewModel.Dependencies {
            ViewModel.Dependencies(
                userDefaults: userDefaults
            )
        }
    }
    
    
}
