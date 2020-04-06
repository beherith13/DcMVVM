//
//  SecondViewController.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import UIKit
import DcMVVM
import RxSwift

class SecondViewController: UIViewController, DecomposedViewType {
    typealias ViewModel = SecondViewModel
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    private let disposeBag = DisposeBag()
    var viewModel: ViewModel.Instance!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind().disposed(by: disposeBag)
    }

    func input() -> Input {
        Input(
            close: closeButton.rx.tap.asObservable()
        )
    }
    
    func bind(to output: Output) -> [Disposable] {
        [
            output.buttonTitle.drive(closeButton.rx.title()),
            output.title.drive(titleLabel.rx.text),
            output.description.drive(descriptionLabel.rx.text),
        ]
    }

}
