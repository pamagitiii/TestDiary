//
//  MainPresenterMock.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 09.02.2022.
//

import Foundation
@testable import TestDiary

final class MainPresenterMock {
    
    var stubbedTasksArray: [Task] = []
    var stubbedIsDidLoadTasks: Bool = false
    
    var stubbedDate: Date?
    var stubbedId: Int?
    var stubbedIsViewDidLoad: Bool = false
    var stubbedIsDidTapAddButton: Bool = false
    var stubbedIsDidSelectDate: Bool = false
    var stubbedIsDidSelectRowWith: Bool = false
}

extension MainPresenterMock: MainInteractorOutput {
    func didLoadTasks(tasks: [Task], forDate: Date) {
        stubbedIsDidLoadTasks = true
        self.stubbedTasksArray = tasks
    }
}

extension MainPresenterMock: MainViewOutput {
    func viewDidLoad(calendarToday: Date) {
        self.stubbedDate = calendarToday
        stubbedIsViewDidLoad = true
    }
    
    func didTapAddButton() {
        stubbedIsDidTapAddButton = true
    }
    
    func didSelectDate(date: Date) {
        self.stubbedDate = date
        stubbedIsDidSelectDate = true
    }
    
    func didSelectRowWith(id: Int) {
        self.stubbedId = id
        stubbedIsDidSelectRowWith = true
    }
}
