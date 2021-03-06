//
//  CoordinatorType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public protocol CoordinatorType: ViewBuilderType {
    associatedtype Context
    associatedtype Result
    
    typealias Instance = CoordinatorInstance<Self>
    typealias Factory = CoordinatorFactory<Self>
    typealias Completion = (Result) -> Void
    
    init(context: Context)
    
    func bind(events: Events, completion: @escaping Completion) -> [Terminatable]
    func navigate(to view: View)
}

public extension CoordinatorType {
    static func instance(with context: Context, dependencies: Dependencies, factories: FactoryPair) -> Instance {
        return Instance { params, completion in
            let coordinator = Self(context: context)
            
            let instance = view(with: params, dependencies: dependencies, factories: factories) { events in
                return coordinator.bind(events: events, completion: completion)
            }
            coordinator.navigate(to: instance)
        }
    }
    
    static func instance(with context: Context, dependencies: Dependencies) -> Instance {
        return instance(with: context, dependencies: dependencies, factories: defaultFactories)
    }
    
    static func factory() -> Factory {
        return Factory(handler: instance)
    }
}
