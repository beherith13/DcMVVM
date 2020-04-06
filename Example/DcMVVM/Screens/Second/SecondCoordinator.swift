//
//  SecondCoordinator.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM

struct SecondCoordinator: CoordinatorType {
    typealias View = SecondViewController

    struct Context {
        let navigationController: UINavigationController
        var animated = true
    }

    static let defaultFactories = factories(with: View.storyboardFactory())

    static func bind(events: Events, with context: Context) -> [Terminatable] {
        [ events.didClose.emit(onNext: wrap(close(with:), with: context)) ]
    }
    
    static func navigate(to view: SecondViewController, with context: Context) {
        context.navigationController.pushViewController(view, animated: context.animated)
    }
    
    private static func close(with context: Context) -> Void {
        context.navigationController.popViewController(animated: context.animated)
    }
}
