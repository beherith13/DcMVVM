//
//  Array+Disposable.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import RxSwift

extension Array where Element == Disposable {
    public func disposed(by bag: DisposeBag) {
        forEach { $0.disposed(by: bag) }
    }
}
