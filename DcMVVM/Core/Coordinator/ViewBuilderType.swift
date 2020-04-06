//
//  ViewBuilderType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public protocol ViewBuilderType {
    associatedtype View: ViewType
    
    typealias ViewModel = View.ViewModel
    typealias Dependencies = View.Dependencies
    typealias Params = View.Params
    typealias Events = View.Events
    typealias Terminatable = View.Terminatable
    typealias FactoryPair = (viewModel: ViewModel.Factory, view: View.Factory)
    
    static var defaultFactories: FactoryPair { get }
}

public extension ViewBuilderType {
    static func factories(with viewFactory: View.Factory) -> FactoryPair {
        return (ViewModel.factory(), viewFactory)
    }
}

public extension ViewBuilderType {
    static func view(
        with params: Params,
        dependencies: Dependencies,
        factories: FactoryPair,
        binder: @escaping View.ViewModel.EventsBinder
    ) -> View {
        var view = factories.view.instance()
       
        let viewModel = factories.viewModel.instance(
            with: params,
            dependencies: dependencies,
            binder: binder
        )
        view.set(viewModel: viewModel)
        
        return view
    }
    
    static func view(
        with params: Params,
        dependencies: Dependencies,
        binder: @escaping View.ViewModel.EventsBinder
    ) -> View {
        return view(
            with: params,
            dependencies: dependencies,
            factories: defaultFactories,
            binder: binder
        )
    }
}
