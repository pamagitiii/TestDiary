//
//  NewTaskInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import Foundation

final class NewTaskInteractor {
	weak var output: NewTaskInteractorOutput?

    private let taskRealmService: TaskRealmProtocol
    
    init(taskRealmService: TaskRealmProtocol) {
        self.taskRealmService = taskRealmService
    }
}

extension NewTaskInteractor: NewTaskInteractorInput {
    func saveNewTask(taskName: String?, startDate: Date?, endDate: Date?, taskDesription: String?) {
        
        
        guard let lastId = taskRealmService.getLastTaskId() else {
            
        }
        var newId = lastId += 1
        
        
        let id = 9
        let task = Task(id: id, name: taskName!, dateStart: startDate!, dateFinish: endDate!, taskDescription: taskDesription)
        taskRealmService.saveTask(task: task)
    }
    
}
