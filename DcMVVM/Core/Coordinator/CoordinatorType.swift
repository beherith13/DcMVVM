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
    
    typealias Instance = CoordinatorInstance<Self>
    typealias Factory = CoordinatorFactory<Self>
    
    init(context: Context)
    
    func bind(events: Events) -> [Terminatable]
    func navigate(to view: View)
}

public extension CoordinatorType {
    static func instance(with context: Context, dependencies: Dependencies, factories: FactoryPair) -> Instance {
        return Instance { params in
            let coordinator = Self(context: context)
            
            let instance = view(with: params, dependencies: dependencies, factories: factories) { events in
                return coordinator.bind(events: events)
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
