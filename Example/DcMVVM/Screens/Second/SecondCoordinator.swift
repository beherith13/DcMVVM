//
//  SecondCoordinator.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
import RxSwift
import RxCocoa

struct SecondCoordinator: CoordinatorType {
    typealias View = SecondViewController
    typealias Result = FirstModel
    static let defaultFactories = factories(with: View.storyboardFactory())

    struct Context {
        let navigationController: UINavigationController
        var animated = true
    }
    
    let context: Context

    func navigate(to view: SecondViewController) {
        context.navigationController.pushViewController(view, animated: context.animated)
    }
    
    func bind(events: Events, completion: @escaping Completion) -> [Terminatable] {
        return [
            events.didClose.do(onNext: close).emit(onNext: completion)
        ]
    }
    
    private func close(item: FirstModel) -> Void {
        context.navigationController.popViewController(animated: context.animated)
    }
}
