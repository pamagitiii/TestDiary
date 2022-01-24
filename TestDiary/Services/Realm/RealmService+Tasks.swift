//
//  RealmService+Tasks.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
//

import Foundation
import RealmSwift

extension RealmService: TaskRealmProtocol {
    

    func getLastTaskId() -> Int? {
        return fetchSortedObjects(objecType: Task.self, keyPath: "id", ascending: false).first?.id
    }
    
    func getAllTasks() -> [Task]? {
        return fetchArrayOfObjects(objecType: Task.self)
    }
    
    func saveTask(task: Task) {
        saveToRealm(nil, task)
    }
    
    func deleteTaskWith(primaryKey: Int) {
        deleteObjectByPrimaryKey(objecType: Task.self, primaryKey: primaryKey)
    }
    
    func getTaskBy(primaryKey: Int) -> Task? {
        return fetchObjectByPrimaryKey(objecType: Task.self, primaryKey: primaryKey) //-------------------
    }
    
    func saveTasks(tasks: [Task]) {
        saveToRealm(tasks, nil)
    }
    
    func subscribeToTasksNotifications() {
        let objects = realm.objects(Task.self)
        notificationCenter = NotificationCenter.default
        notificationToken = objects.observe { [weak self] changes in
            
            switch changes {
            case.update(_, deletions: _, insertions: _, modifications: _):
                self?.notificationCenter?.post(name: Notification.Name("DataBaseUpdated"), object: nil)
            case.initial(_):
                break
            case.error(_):
                break
            }
        }
    }
}
