//
//  FirstCellModel.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
import RxSwift
import RxCocoa

struct FirstCellModel: RxViewModelType {
    typealias Dependencies = Void
    typealias Params = FirstModel
    
    struct Input {
        let open: Observable<Void>
    }
    
    struct Output {
        let title: Driver<String>
    }
    
    struct Events {
        let didOpen: Observable<Void>
    }
    
    static func bind(params: Params, dependencies: Dependencies, input: Input) -> (Output, Events) {
        let title = Driver.just(params.title)        
        let didOpen = input.open
        
        return (
            Output(title: title),
            Events(didOpen: didOpen)
        )
    }
}
