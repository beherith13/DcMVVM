//
//  ViewModelType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public protocol ViewModelType {
    associatedtype Params
    associatedtype Dependencies
    associatedtype Input
    associatedtype Output
    associatedtype Events
    associatedtype Terminatable

    typealias OutputBinder = (Output) -> [Terminatable]
    typealias EventsBinder = (Events) -> [Terminatable]

    typealias Instance = ViewModelInstance<Self>
    typealias Factory = ViewModelFactory<Self>

    static func bind(params: Params, dependencies: Dependencies, input: Input) -> (Output, Events)
}

public extension ViewModelType {
        
    static func instance(with params: Params, dependencies: Dependencies, binder: @escaping EventsBinder) -> Instance {
        return Instance { input, outputBinder in
            let (output, events) = bind(
                params: params,
                dependencies: dependencies,
                input: input
            )
            
            return outputBinder(output) + binder(events)
        }
    }

    static func factory() -> Factory {
        return Factory(handler: instance)
    }
}
