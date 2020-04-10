//
//  SecondCoordinatorTests.swift
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

class SecondCoordinatorTests: XCTestCase {
    let viewModelMock = SecondViewModelMock.Factory()
    let dependenciesMock = SecondViewModelMock.Dependencies()
    let modelStub = FirstModel(id: 1, title: "title")
    
    var navigationController: UINavigationController!
    var sut: SecondCoordinator.Instance!
    
    override func setUp() {
        super.setUp()
        
        let factories = SecondCoordinator.FactoryPair(
            view: SecondViewController.storyboardFactory(),
            viewModel: viewModelMock.factory()
        )
        
        navigationController = UINavigationController(rootViewController: UIViewController())
        
        sut = SecondCoordinator.instance(
            with: SecondCoordinator.Context(
                navigationController: navigationController,
                animated: false
            ),
            dependencies: dependenciesMock.dependencies(),
            factories: factories
        )
 
    }
    
    override func tearDown() {
        sut = nil
        navigationController = nil
        
        super.tearDown()
    }
    
    func testNavigation() {
        sut.start(with: modelStub) { _ in }
        
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertTrue(navigationController.viewControllers.last is SecondViewController)
    }
    
    func testClose() {
        sut.start(with: modelStub) { _ in }
        viewModelMock.didClose.accept(modelStub)

        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testCompletion() {
        var result: SecondCoordinator.Result?
        sut.start(with: modelStub) { result = $0 }
        viewModelMock.didClose.accept(modelStub)

        XCTAssertEqual(result, modelStub)
    }
}
