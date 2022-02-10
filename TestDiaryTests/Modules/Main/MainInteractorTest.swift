//
//  MainInteractorTest.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 09.02.2022.
//

import XCTest
@testable import TestDiary

final class MainInteractorTest: XCTestCase {

    var sut: MainInteractor!
    var presenterMock: MainPresenterMock!
    
    var networServiceMock = TasksNetworkService()
    var realmServiceMock = TaskRealmServiceMock()
    
    private let tasks = [Task(id: 0,
                              name: "Foo",
                              dateStart: Date(),
                              dateFinish: Date(),
                              taskDescription: nil)]
    
    override func setUp() {
        super.setUp()
        sut = MainInteractor(tasksNetworkService: networServiceMock, taskRealmService: realmServiceMock)
        presenterMock = MainPresenterMock()
        
        sut.output = presenterMock
    }
    
    override func tearDown() {
        sut = nil
        presenterMock = nil
        super.tearDown()
    }
}

extension MainInteractorTest {
    func testPresenterDidLoadTasks() {
        XCTAssertFalse(presenterMock.stubbedIsDidLoadTasks)
        XCTAssertTrue(presenterMock.stubbedTasksArray.isEmpty)
        
        sut.output?.didLoadTasks(tasks: tasks, forDate: Date())
        
        XCTAssertTrue(presenterMock.stubbedIsDidLoadTasks)
        XCTAssertFalse(presenterMock.stubbedTasksArray.isEmpty)
    }
}
