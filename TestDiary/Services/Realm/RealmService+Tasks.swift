//
//  RealmService+Tasks.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
//

import Foundation

extension RealmService: TaskRealmProtocol {
    
    func getLastTaskId() -> Int? {
        return realm.objects(Task.self).sorted(byKeyPath: "id", ascending: false).first?.id
    }
    
    func getAllTasks() -> [Task]? {
        return Array(realm.objects(Task.self))
    }
    
    func saveTask(task: Task) {
        saveToRealm(nil, task)
    }
    
    func saveTasks(tasks: [Task]) {
        saveToRealm(tasks, nil)
    }
    
    func subscribeToTasksNotifications() {
        let objects = realm.objects(Task.self)
        notificationToken = objects.observe { [weak self] changes in
            
            switch changes {
            case.update(_, deletions: _, insertions: _, modifications: _):
                self?.notificationCenter.post(name: Notification.Name("DataBaseUpdated"), object: nil)
            case.initial(_):
                break
            case.error(_):
                break
            }
        }
    }
}
