//
//  MainViewControllerTest.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 10.02.2022.
//

import XCTest
@testable import TestDiary

final class MainViewControllerTest: XCTestCase {
    
    var sut: MainViewController!
    var presenterMock: MainPresenterMock!
    
    let dateMock = Date()
    
    override func setUp() {
        super.setUp()
        presenterMock = MainPresenterMock()
        sut = MainViewController(output: presenterMock)
    }
    
    override func tearDown() {
        sut = nil
        presenterMock = nil
        super.tearDown()
    }
}

extension MainViewControllerTest {
    func testPresenterViewDidLoad() {
        XCTAssertFalse(presenterMock.stubbedIsViewDidLoad)
        XCTAssertTrue(presenterMock.stubbedDate == nil)
        
        sut.output.viewDidLoad(calendarToday: dateMock)
        
        XCTAssertTrue(presenterMock.stubbedIsViewDidLoad)
        XCTAssertFalse(presenterMock.stubbedDate == nil)
    }
    
    func testPresenterDidTapAddButton() {
        XCTAssertFalse(presenterMock.stubbedIsDidTapAddButton)
        
        sut.output.didTapAddButton()
        
        XCTAssertTrue(presenterMock.stubbedIsDidTapAddButton)
    }
    
    func testPresenterDidSelectDate() {
        XCTAssertFalse(presenterMock.stubbedIsDidSelectDate)
        XCTAssertTrue(presenterMock.stubbedDate == nil)
        
        sut.output.didSelectDate(date: dateMock)
        
        XCTAssertTrue(presenterMock.stubbedIsDidSelectDate)
        XCTAssertFalse(presenterMock.stubbedDate == nil)
    }
    
    func testPresenterDidSelectRowWith() {
        XCTAssertFalse(presenterMock.stubbedIsDidSelectRowWith)
        XCTAssertTrue(presenterMock.stubbedId == nil)
        
        sut.output.didSelectRowWith(id: 0)
        
        XCTAssertTrue(presenterMock.stubbedIsDidSelectRowWith)
        XCTAssertFalse(presenterMock.stubbedId == nil)
    }
}
