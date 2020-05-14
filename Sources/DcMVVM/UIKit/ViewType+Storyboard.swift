//
//  ViewType+Storyboard.swift
//  DcMVVM
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import UIKit
import DcMVVM

public extension ViewType where Self: UIViewController {
    static func storyboardInstance(
        from name: String? = nil,
        bundle: Bundle? = nil
    ) -> Instance {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: name ?? identifier, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Instance
    }
    
    static func storyboardFactory(
        from name: String? = nil,
        bundle: Bundle? = nil
    ) -> Factory {
        return Factory {
            storyboardInstance(from: name, bundle: bundle)
        }
    }
}
