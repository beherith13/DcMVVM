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
    
    static func bind(events: Events, with context: Context) -> [Terminatable]
    static func navigate(to view: View, with context: Context)
}

public extension CoordinatorType {
    static func instance(with context: Context, dependencies: Dependencies, factories: FactoryPair) -> Instance {
        return Instance { params in
            let instance = view(with: params, dependencies: dependencies, factories: factories) { events in
                return bind(events: events, with: context)
            }
            navigate(to: instance, with: context)
        }
    }
    
    static func instance(with context: Context, dependencies: Dependencies) -> Instance {
        return instance(with: context, dependencies: dependencies, factories: defaultFactories)
    }
    
    static func factory() -> Factory {
        return Factory(handler: instance)
    }

    static func wrap<T>(_ handler: @escaping (T, Context) -> Void, with context: Context) -> (T) -> Void {
        return {
            handler($0, context)
        }
    }
}
