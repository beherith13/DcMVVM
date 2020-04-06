//
//  FirstServiceMock.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import RxSwift
import DcMVVMTest
@testable import DcMVVM_Example

class FirstServiceMock: FirstService {
    var numerOfItems = 20
    
    func load() -> Single<[FirstModel]> {
        return Single
            .just(0...numerOfItems-1)
            .map {
                $0.map { FirstModel(id: $0, title: "Item \($0)") }
            }
    }
}
