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
    func saveNewTask(taskName: String?, startDate: Date?, endDate: Date?, taskDesription: String?) {
        
        guard let taskName = taskName, let startDate = startDate, let endDate = endDate else { return }
        let lastId: Int? = taskRealmService.getLastTaskId()
        var newId: Int
        
        if lastId != nil {
            newId = lastId!
            newId += 1
        } else {
            newId = generateNewId(firstDate: startDate, secondDate: endDate)
        }
        let newTask = Task(id: newId, name: taskName, dateStart: startDate, dateFinish: endDate, taskDescription: taskDesription)
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
