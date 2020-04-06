//
//  FirstCell.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import UIKit
import DcMVVM
import RxSwift

class FirstCell: UITableViewCell, ViewType/*, SelfInstantiable*/ {
    typealias ViewModel = FirstCellModel
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    private var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    func set(viewModel: ViewModel.Instance) {
        let input = Input(
            open: actionButton.rx.tap.asObservable()
        )
        
        viewModel.bind(input: input) { output in
            [ output.title.drive(titleLabel.rx.text) ]
        }.disposed(by: disposeBag)
    }
    

}
