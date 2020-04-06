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

    struct Context {
        let navigationController: UINavigationController
        let userDefaults: UserDefaultsService
        
        var secondCoordinator = SecondCoordinator.factory()
        var animated = true
    }
        
    static let defaultFactories = factories(with: View.storyboardFactory(from: "FirstStoryboard"))
    
    static func navigate(to view: FirstViewController, with context: Context) {
        context.navigationController.pushViewController(view, animated: context.animated)
    }
    
    static func bind(events: Events, with context: Context) -> [Terminatable] {
        [ events.didOpen.emit(onNext: wrap(open(item:with:), with: context)) ]
    }
    
    private static func open(item: FirstModel, with context: Context) {
        let coordinator = context.secondCoordinator.instance(
            with: SecondCoordinator.Context(
                navigationController: context.navigationController
            ),
            dependencies: SecondViewModel.Dependencies(
                userDefaults: context.userDefaults
            )
        )
        
        coordinator.start(with: item)
    }
}
