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
}
