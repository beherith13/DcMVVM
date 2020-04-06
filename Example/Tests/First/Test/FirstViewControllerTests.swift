//
//  FirstViewControllerTests.swift
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

class FirstViewControllerTests: XCTestCase {
    let viewModelMock = FirstViewModelMock.Instance()
    var sut: FirstViewController!
    
    override func setUp() {
        super.setUp()
        
        // Sut
        sut = FirstViewController.storyboardInstance(from: "FirstStoryboard")
        sut.set(viewModel: viewModelMock.instance())
        
        let _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testText() {
        viewModelMock.outputText.accept("test")
        
        XCTAssertEqual(sut.textLabel.text, "test")
    }
    
    func testLoading() {
        viewModelMock.outputLoading.accept(true)

        XCTAssertEqual(sut.activityIndicator.isAnimating, true)
    }
}
