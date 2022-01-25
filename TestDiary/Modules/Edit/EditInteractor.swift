//
//  EditInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

final class EditInteractor {
	weak var output: EditInteractorOutput?
    private let id: Int
    
    private let taskRealmService: TaskRealmProtocol
    
    init(taskRealmService: TaskRealmProtocol, id: Int) {
        self.taskRealmService = taskRealmService
        self.id = id
    }
}

extension EditInteractor: EditInteractorInput {
    func updateTask(editedTaskViewModel: EditTaskViewModel) {
        let taskToUpdate = Task(id: id,
                                name: editedTaskViewModel.name,
                                dateStart: editedTaskViewModel.startDate,
                                dateFinish: editedTaskViewModel.endDate,
                                taskDescription: editedTaskViewModel.description)
        
        taskRealmService.saveTask(task: taskToUpdate)
    }
    
    func deleteTask() {
        self.taskRealmService.deleteTaskWith(primaryKey: id)
    }
    
    func getTask() {
        guard let task = taskRealmService.getTaskBy(primaryKey: id) else { return }
        output?.didLoadTask(task: task)
    }
    
}
