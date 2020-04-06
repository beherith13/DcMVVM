//
//  FirstViewController.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import UIKit
import DcMVVM
import RxSwift
import RxDataSources

class FirstViewController: UIViewController, ViewType {
    typealias ViewModel = FirstViewModel
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    private var viewModel: ViewModel.Instance!
    
    func set(viewModel: ViewModel.Instance) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bind(
            input: input(),
            binder: bind(output:)
        ).disposed(by: disposeBag)
    }
    
    private func input() -> Input {
        Input(
            selection: tableView.rx.itemSelected.asObservable()
        )
    }
    
    private func bind(output: Output) -> [Terminatable] {
        [
            output.loading.drive(activityIndicator.rx.isAnimating),
            output.text.drive(textLabel.rx.text),
            output.items.drive(tableView.rx.items(dataSource: dataSource))
        ]
    }
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionModel<Void, FirstCellModel.Instance>>(configureCell: { (dataSource, tableView, indexPath, cellModel) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! FirstCell
            cell.set(viewModel: cellModel)
            return cell
    })
}
