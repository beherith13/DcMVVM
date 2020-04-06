//
//  FirstViewModelMock.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import DcMVVMTest
import Differentiator
import DcMVVMTest
@testable import DcMVVM_Example

enum FirstViewModelMock: ViewModelMockType {
    typealias ViewModel = FirstViewModel

    final class Instance: ViewModelInstanceMockType {
        typealias ViewModel = FirstViewModel
        
        let outputItems = PublishRelay<[SectionModel<Void, FirstCellModel.Instance>]>()
        let outputLoading = PublishRelay<Bool>()
        let outputText = PublishRelay<String?>()
        
        func output(for input: ViewModel.Input) -> Output {
            return Output(
                items: self.outputItems.asDriver(onErrorJustReturn: []),
                loading: self.outputLoading.asDriver(onErrorJustReturn: false),
                text: self.outputText.asDriver(onErrorJustReturn: nil)
            )
        }
    }
    
    final class Factory: ViewModelFactoryMockType {
        typealias ViewModel = FirstViewModel
        
        private let disposeBag = DisposeBag()
        let eventDidOpen = PublishRelay<FirstModel>()
        
        func events(with params: Params) -> Events {
            Events(
                didOpen: self.eventDidOpen.asSignal()
            )
        }
        
        func dispose(_ terminatables: [Disposable]) {
            terminatables.disposed(by: disposeBag)
        }
    }
    
    final class Input: ViewModelInputMockType {
        typealias ViewModel = FirstViewModel

        let inputSelect = PublishRelay<IndexPath>()

        func input() -> ViewModel.Input {
            ViewModel.Input(
                selection: inputSelect.asObservable()
            )
        }
    }
    
    final class Dependencies: ViewModelDependenciesMockType {
        typealias ViewModel = FirstViewModel
        
        let service = FirstServiceMock()
        let cellModelFactory = FirstCellModelMock.Factory()

        func dependencies() -> ViewModel.Dependencies {
            ViewModel.Dependencies(
                service: service,
                cellModelFactory: cellModelFactory.factory()
            )
        }
    }
}
