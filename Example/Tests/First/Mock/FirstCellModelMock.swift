//
//  FirstCellModelMock.swift
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

enum FirstCellModelMock: ViewModelMockType {
    typealias ViewModel = FirstCellModel
    typealias Dependencies = VoidDependencies

    final class Instance: ViewModelInstanceMockType {
        // TODO: find way to avoid duplicatiton of view model type declaration
        typealias ViewModel = FirstCellModel
        
        let outputTitle = PublishRelay<String>()
        
        func output(for input: FirstCellModel.Input) -> ViewModel.Output {
            ViewModel.Output(title: outputTitle.asDriver(onErrorJustReturn: ""))
        }
    }
    
    final class Factory: ViewModelFactoryMockType {
        typealias ViewModel = FirstCellModel
        private let disposeBag = DisposeBag()

        let eventDidOpen = PublishRelay<Int>()
        
        func events(with params: FirstModel) -> ViewModel.Events {
            ViewModel.Events(
                didOpen: self.eventDidOpen
                    .filter { $0 == params.id }
                    .map { _ in () }
                    .asObservable()
            )
        }
        
        func dispose(_ terminatables: [Disposable]) {
            terminatables.disposed(by: self.disposeBag)
        }
    }
    
    final class Input: ViewModelInputMockType {
        typealias ViewModel = FirstCellModel
        
        let inputOpen = PublishRelay<Void>()

        func input() -> ViewModel.Input {
            ViewModel.Input(
                open: inputOpen.asObservable()
            )
        }
        
    }
}
