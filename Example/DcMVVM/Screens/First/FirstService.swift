//
//  FirstService.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import RxSwift

protocol FirstService {
    func load() -> Single<[FirstModel]>
}

class FirstServiceImpl: FirstService {
    func load() -> Single<[FirstModel]> {
        return Single.just(1...20)
            .delay(.seconds(4), scheduler: MainScheduler.instance)
            .map { identifiers in
                identifiers.map { FirstModel(id: $0, title: "Item \($0)") }  
            }
    }
}
