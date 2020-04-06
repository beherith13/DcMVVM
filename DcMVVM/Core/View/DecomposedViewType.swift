//
//  DecomposedViewType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public protocol DecomposedViewType: ViewType {
    var viewModel: ViewModel.Instance! { get set }

    func input() -> Input
    func bind(to output: Output) -> [Terminatable]
}

public extension DecomposedViewType {
    func bind() -> [Terminatable] {
        return viewModel.bind(input: input(), binder: bind(to:))
    }
    
    mutating func set(viewModel: ViewModel.Instance) {
        self.viewModel = viewModel
    }
}

public extension DecomposedViewType where Input == Void {
    var input: Input { () }
}
