//
//  ServicesMock.swift
//  TestDiaryTests
//
//  Created by Anatoliy on 09.02.2022.
//

import Foundation
@testable import TestDiary

final class TasksNetworkService: TasksNetworkProtocol {
    func requestTasks(params: TasksRequestParams, completion: @escaping (Result<TasksRespose, Error>) -> Void) {
        return
    }
}

final class TaskRealmServiceMock: TaskRealmProtocol {
    var notificationCenter: NotificationCenter?
    
    func saveTask(task: Task) {
        
    }
    
    func saveTasks(tasks: [Task]) {
        
    }
    
    func deleteTaskWith(primaryKey: Int) {
        
    }
    
    func getLastTaskId() -> Int? {
        return nil
    }
    
    func getAllTasks() -> [Task]? {
        return nil
    }
    
    func getTaskBy(primaryKey: Int) -> Task? {
        return nil
    }
    
    func subscribeToTasksNotifications() {
        
    }
    
}
