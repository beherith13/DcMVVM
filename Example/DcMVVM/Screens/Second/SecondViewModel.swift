//
//  SecondViewModel.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
import RxSwift
import RxCocoa

struct SecondViewModel: RxViewModelType {
    typealias Params = FirstModel
    
    struct Dependencies {
        let userDefaults: UserDefaultsService
    }
    
    struct Input {
        let close: Observable<Void>
    }
    
    struct Output {
        let title: Driver<String>
        let description: Driver<String>
        let buttonTitle: Driver<String>
    }
    
    struct Events {
        let didClose: Signal<Void>
    }

    static func bind(params item: FirstModel, dependencies: Dependencies, input: Input) -> (Output, Events) {
        let title: Driver<String> = .just("ID is \(item.id)")
        let description: Driver<String> = .just("Title is \(item.title)")
        let buttonTitle: Driver<String> = .just("Close")
        
        let didClose = input.close.asSignal(onErrorJustReturn: ())
        
        return (
            Output(
                title: title,
                description: description,
                buttonTitle: buttonTitle
            ),
            Events(
                didClose: didClose
            )
        )
    }
}
