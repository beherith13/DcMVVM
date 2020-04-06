//
//  FirstViewModel.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
import RxSwift
import RxCocoa
import Differentiator

struct FirstViewModel: RxViewModelType {
    typealias Params = Void
    
    struct Dependencies {
        let service: FirstService
        let cellModelFactory: FirstCellModel.Factory
    }
    
    struct Input {
        let selection: Observable<IndexPath>
    }
    
    struct Output {
        let items: Driver<[SectionModel<Void, FirstCellModel.Instance>]>
        let loading: Driver<Bool>
        let text: Driver<String?>
    }
    
    struct Events {
        let didOpen: Signal<FirstModel>
    }

    static func bind(params: Params, dependencies: Dependencies, input: Input) -> (Output, Events) {
        let loadingRelay = PublishRelay<Bool>()
        let openRelay = PublishRelay<FirstModel>()

        let items = Observable<Void>.just(())
            .do(onNext: { _ in loadingRelay.accept(true) })
            .flatMap { _ in dependencies.service.load() }
            .do(onNext: { _ in loadingRelay.accept(false) })
        
        let cellModels = items
            .map { items in
                items.map { item in
                    dependencies.cellModelFactory.instance(params: item) { events in
                        [ events.didOpen.map { item }.bind(to: openRelay) ]
                    }
                }
            }
            .map { [SectionModel(model: (), items: $0)] }
            .asDriver(onErrorJustReturn: [])
        
        let selection = input.selection
            .withLatestFrom(items) { $1[$0.row] }
        
        let text: Driver<String?> = selection
            .map { $0.title }
            .startWith(nil)
            .asDriver(onErrorJustReturn: nil)
        
        let loading = loadingRelay
            .startWith(false)
            .asDriver(onErrorJustReturn: false)
        
        let didOpen = openRelay.asSignal()
        
        return (
            Output(
                items: cellModels,
                loading: loading,
                text: text
            ),
            Events(
                didOpen: didOpen
            )
        )
    }
}
