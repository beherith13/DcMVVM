//
//  FirstCoordinator.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
import RxSwift

struct FirstCoordinator: CoordinatorType {
    typealias View = FirstViewController
    typealias Result = Void
    static let defaultFactories = factories(with: View.storyboardFactory(from: "FirstStoryboard"))

    struct Context {
        let navigationController: UINavigationController
        let userDefaults: UserDefaultsService
        
        var secondCoordinator = SecondCoordinator.factory()
        var animated = true
    }
        
    let context: Context

    func navigate(to view: FirstViewController) {
        context.navigationController.pushViewController(view, animated: context.animated)
    }
    
    func bind(events: Events, completion: @escaping Completion) -> [Terminatable] {
        [ events.didOpen.emit(onNext: open) ]
    }
    
    private func open(item: FirstModel) {
        let coordinator = context.secondCoordinator.instance(
            with: SecondCoordinator.Context(
                navigationController: context.navigationController
            ),
            dependencies: SecondViewModel.Dependencies(
                userDefaults: context.userDefaults
            )
        )
        
        coordinator.start(with: item) { result in
            print("Flow complete with \(result.id)")
        }
    }
}
