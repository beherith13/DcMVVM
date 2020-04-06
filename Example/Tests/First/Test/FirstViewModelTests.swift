//
//  FirstViewModelTests.swift
//  DcMVVM_Example
//
//  Created by Siarhei Bykau on 10.01.20.
//  Copyright © 2020 Siarhei Bykau. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import Differentiator
import DcMVVMTest
@testable import DcMVVM_Example

class FirstViewModelTests: XCTestCase {
    let dependenciesMock = FirstViewModelMock.Dependencies()
    let inputMock = FirstViewModelMock.Input()
    let cellModelFactoryMock = FirstCellModelMock.Factory()

    let eventDidOpen = BehaviorRelay<FirstModel?>(value: nil)
    let outputItems = BehaviorRelay<[SectionModel<Void, FirstCellModel.Instance>]?>(value: nil)
    let outputLoading = BehaviorRelay<Bool?>(value: nil)
    let outputText = BehaviorRelay<String?>(value: nil)

    var disposeBag: DisposeBag!
    var sut: FirstViewModel.Instance!
    
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
                
        // Sut
        sut = FirstViewModel.instance(
            dependencies: dependenciesMock.dependencies()
        ) { events -> [Disposable] in
            [ events.didOpen.emit(to: self.eventDidOpen) ]
        }
        
        sut.bind(input: inputMock.input()) { output in
            [
                output.items.drive(outputItems),
                output.loading.drive(outputLoading),
                output.text.drive(outputText)
            ]
        }.disposed(by: disposeBag)
    }
    
    override func tearDown() {
        disposeBag = nil
        sut = nil
        
        super.tearDown()
    }

    func testItems() {
        XCTAssertEqual(outputItems.value?.first?.items.count, dependenciesMock.service.numerOfItems)
    }
    
    func testOpening() {
        dependenciesMock.cellModelFactory.eventDidOpen.accept(3)
        
        XCTAssertEqual(eventDidOpen.value?.id, 3)
    }
    
    func testSelection() {
        inputMock.inputSelect.accept(IndexPath(row: 5, section: 0))
        
        XCTAssertEqual(outputText.value, "Item 5")
    }

}
