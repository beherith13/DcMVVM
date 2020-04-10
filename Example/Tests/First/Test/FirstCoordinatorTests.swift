//
//  FirstCoordinatorTests.swift
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

class FirstCoordinatorTests: XCTestCase {
    let viewModelMock = FirstViewModelMock.Factory()
    let dependenciesMock = FirstViewModelMock.Dependencies()
    let secondCoordinatorMock = SecondCoordinator.mock()
    let modelStub = FirstModel(id: 1, title: "test")

    var navigationController: UINavigationController!
    var sut: FirstCoordinator.Instance!
    
    override func setUp() {
        super.setUp()
        
        navigationController = UINavigationController()
        
        // Mocks
        let factories = FirstCoordinator.FactoryPair(
            view: FirstViewController.storyboardFactory(from: "FirstStoryboard"),
            viewModel: viewModelMock.factory()
        )

        // Sut
        sut = FirstCoordinator.instance(
            with: FirstCoordinator.Context(
                navigationController: navigationController,
                userDefaults: UserDefaultsMock(),
                secondCoordinator: secondCoordinatorMock.factory()
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
        sut.start()
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.viewControllers.last is FirstViewController)
    }
    
    func testOpenEvent() {
        sut.start()
        viewModelMock.eventDidOpen.accept(modelStub)
        
        XCTAssertEqual(secondCoordinatorMock.initCalled?.context.navigationController, navigationController)
        XCTAssertTrue(secondCoordinatorMock.initCalled?.dependencies.userDefaults is UserDefaultsMock)
        XCTAssertEqual(secondCoordinatorMock.startParams, modelStub)
    }

    func testSecondCoordinatorCompletion() {
        sut.start()
        viewModelMock.eventDidOpen.accept(modelStub)
        secondCoordinatorMock.startCompletion?(modelStub)
        
        // TODO: Add third coordinator to example and test its start on completion
    }
}
