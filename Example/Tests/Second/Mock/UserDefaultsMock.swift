//
//  UserDefaultsMock.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation
import DcMVVM
@testable import DcMVVM_Example


final class UserDefaultsMock: UserDefaultsService {
    var intValue = 0
    func integer(forKey defaultName: String) -> Int {
        return intValue
    }
    
    func set(_ value: Int, forKey: String) {
        intValue = value
    }
}
