//
//  ViewType+UIKit.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import UIKit

public extension ViewType where Self: UIViewController {
    static func instance() -> Instance {
        return Instance()
    }
    
    static func factory() -> Factory {
        return Factory(handler: instance)
    }
}
