//
//  RealmSeviceProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 15.01.2022.
//

import Foundation

protocol TaskRealmProtocol {
    
    func saveTask(task: Task)
    func saveTasks(tasks: [Task])
    func getLastTaskId() -> Int?
}
