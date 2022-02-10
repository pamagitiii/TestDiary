//
//  MainInteractorMock.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 08.02.2022.
//

import Foundation
@testable import TestDiary

final class MainInteractorMock {
    
    var date: Date?
    var stubbedIsUpdateDataBaseFromNetwork: Bool = false
    var stubbedIsGetTasksBy: Bool = false
    
}

extension MainInteractorMock: MainInteractorInput {
    func updateDataBaseFromNetwork(todayDate: Date) {
        self.date = todayDate
        stubbedIsUpdateDataBaseFromNetwork = true
    }
    
    func getTasksBy(date: Date) {
        self.date = date
        stubbedIsGetTasksBy = true
    }
    
}
