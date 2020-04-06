//
//  UserDefaultsService.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import Foundation

protocol UserDefaultsService {
    func integer(forKey defaultName: String) -> Int
    func set(_ value: Int, forKey: String)
}

extension UserDefaults: UserDefaultsService { }
