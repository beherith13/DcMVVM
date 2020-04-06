//
//  SecondViewModelTests.swift
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

class SecondViewModelTests: XCTestCase {
    let dependenciesMock = SecondViewModelMock.Dependencies()
    let eventDidOpen = BehaviorRelay<Void?>(value: nil)
    let inputClose = PublishRelay<Void>()
    let outputButtonTitle = BehaviorRelay<String?>(value: nil)
    let outputTitle = BehaviorRelay<String?>(value: nil)
    let outputDescription = BehaviorRelay<String?>(value: nil)
    
    var disposeBag: DisposeBag!
    var sut: SecondViewModel.Instance!
    
    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        sut = SecondViewModel.instance(
            with: FirstModel(id: 1, title: "title"),
            dependencies: dependenciesMock.dependencies()) { events in
                [ events.didClose.emit(to: self.eventDidOpen) ]
            }
        
        let input = SecondViewModel.Input(
            close: inputClose.asObservable()
        )
        
        sut.bind(input: input) { output in
            [
                output.buttonTitle.drive(outputButtonTitle),
                output.title.drive(outputTitle),
                output.description.drive(outputDescription)
            ]
        }.disposed(by: disposeBag)
    }
    
    override func tearDown() {
        sut = nil
        disposeBag = nil
        
        super.tearDown()
    }
    
    func testClose() {
        inputClose.accept(())
        
        XCTAssertNotNil(eventDidOpen.value)
    }
    
    func testTitle() {
        XCTAssertEqual(outputTitle.value, "ID is 1")
    }
    
    func testDescription() {
        XCTAssertEqual(outputDescription.value, "Title is title")
    }
    
    func testButtonTitle() {
        XCTAssertEqual(outputButtonTitle.value, "Close")
    }
}
