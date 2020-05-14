//
//  RxViewModelType.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import RxSwift
import DcMVVM

public protocol RxViewModelType: ViewModelType where Terminatable == Disposable { }
