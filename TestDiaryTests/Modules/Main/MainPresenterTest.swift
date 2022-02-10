//
//  MainPresenterTest.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 09.02.2022.
//

import XCTest
@testable import TestDiary

final class MainPresenterTest: XCTestCase {
    
    var sut: MainPresenter!
    var interactorMock: MainInteractorMock!
    var viewControllerMock: MainVCMock!
    var routerMock: MainRouterInput!
    
    let dateMock = Date()
    
    let cellViewModelsMock = [CellViewModel(id: 0, taskNameText: "Baz", startDateText: "Bar", endDateText: "Foo")]
    var viewModelsMock: [SectionViewModel] = []
    
    override func setUp() {
        super.setUp()
        interactorMock = MainInteractorMock()
        viewControllerMock = MainVCMock()
        routerMock = MainRouterMock()
        
        sut = MainPresenter(router: routerMock, interactor: interactorMock)
        sut.view = viewControllerMock
        
        let sectionViewModelMock = SectionViewModel(headetTitleText: "Foo", cellViewModels: cellViewModelsMock)
        viewModelsMock.append(sectionViewModelMock)
    }
    
    override func tearDown() {
        sut = nil
        interactorMock = nil
        viewControllerMock = nil
        routerMock = nil
        super.tearDown()
    }
}

extension MainPresenterTest {
    func testViewControllerSet() {
        XCTAssertFalse(viewControllerMock.stubbedIsSet)
        XCTAssertTrue(viewControllerMock.stubbedViewModelsArray.isEmpty)
        
        sut.view?.set(viewModels: viewModelsMock)
        
        XCTAssertTrue(viewControllerMock.stubbedIsSet)
        XCTAssertFalse(viewControllerMock.stubbedViewModelsArray.isEmpty)
    }
    
    func testInteractorUpdateDataBaseFromNetwork() {
        XCTAssertFalse(interactorMock.stubbedIsUpdateDataBaseFromNetwork)
        XCTAssertTrue(interactorMock.date == nil)
        
        sut.interactor.updateDataBaseFromNetwork(todayDate: dateMock)
        
        XCTAssertTrue(interactorMock.stubbedIsUpdateDataBaseFromNetwork)
        XCTAssertFalse(interactorMock.date == nil)
    }
    
    func testInteractorGetTasksBy() {
        XCTAssertFalse(interactorMock.stubbedIsGetTasksBy)
        XCTAssertTrue(interactorMock.date == nil)
        
        sut.interactor.getTasksBy(date: dateMock)
        
        XCTAssertTrue(interactorMock.stubbedIsGetTasksBy)
        XCTAssertFalse(interactorMock.date == nil)
    }
    
}
