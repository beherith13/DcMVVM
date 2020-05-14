//
//  ViewType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

public protocol ViewType {
    associatedtype ViewModel: ViewModelType

    typealias Params = ViewModel.Params
    typealias Dependencies = ViewModel.Dependencies
    typealias Input = ViewModel.Input
    typealias Output = ViewModel.Output
    typealias Events = ViewModel.Events
    typealias Terminatable = ViewModel.Terminatable
    
    typealias Instance = Self
    typealias Factory = ViewFactory<Self>

    mutating func set(viewModel: ViewModel.Instance)
}
