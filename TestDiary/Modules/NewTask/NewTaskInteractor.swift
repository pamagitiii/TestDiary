//
//  NewTaskInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//swiftlint:disable force_unwrapping

import Foundation

final class NewTaskInteractor {
    weak var output: NewTaskInteractorOutput?
    
    private let taskRealmService: TaskRealmProtocol
    
    init(taskRealmService: TaskRealmProtocol) {
        self.taskRealmService = taskRealmService
    }
}

extension NewTaskInteractor: NewTaskInteractorInput {
    func saveNewTask(newTaskViewModel: EditTaskViewModel) {
        
        let lastId: Int? = taskRealmService.getLastTaskId()
        var newId: Int
        
        if lastId != nil {
            newId = lastId!
            newId += 1
        } else {
            newId = generateNewId(firstDate: newTaskViewModel.startDate, secondDate: newTaskViewModel.endDate)
        }
        let newTask = Task(id: newId,
                           name: newTaskViewModel.name,
                           dateStart: newTaskViewModel.startDate,
                           dateFinish: newTaskViewModel.endDate,
                           taskDescription: newTaskViewModel.description)
        
        taskRealmService.saveTask(task: newTask)
    }
}

private extension NewTaskInteractor {
    func generateNewId(firstDate: Date, secondDate: Date) -> Int {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MdHm"
        
        let firsValue = Int(dateFormatter.string(from: firstDate))
        let secondValue = Int(dateFormatter.string(from: secondDate))
        guard let firsValue = firsValue, let secondValue = secondValue else { return 1 }
        let randomValue = Int.random(in: 1...9)
        return (firsValue + secondValue) * randomValue
    }
}
