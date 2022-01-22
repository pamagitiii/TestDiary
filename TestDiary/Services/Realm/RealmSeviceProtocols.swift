//
//  RealmSeviceProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
//

import Foundation
import RealmSwift

protocol TaskRealmProtocol {
    
    var notificationCenter: NotificationCenter { get }
    
    func saveTask(task: Task)
    func saveTasks(tasks: [Task])
    
    func getLastTaskId() -> Int?
    func getAllTasks() -> [Task]?
    func subscribeToTasksNotifications()
}
