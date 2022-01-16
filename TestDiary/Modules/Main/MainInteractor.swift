//
//  MainInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
// swiftlint:disable force_unwrapping no_direct_standard_out_logs

import Foundation

final class MainInteractor {
	weak var output: MainInteractorOutput?
    private let tasksNetworkService: TasksNetworkProtocol
    private let taskRealmService: TaskRealmProtocol
    
    init(tasksNetworkService: TasksNetworkProtocol, taskRealmService: TaskRealmProtocol) {
        self.tasksNetworkService = tasksNetworkService
        self.taskRealmService = taskRealmService
    }
}

extension MainInteractor: MainInteractorInput {
    func updateDataBaseFromNetwork() {
        let params = TasksRequestParams(resourceName: "MockData", withExtension: "json")
        tasksNetworkService.requestTasks(params: params) { [weak self] result in
            
            switch result {
            case .success(let response):
                self?.taskRealmService.saveTasks(tasks: response.tasks)

                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                print(paths[0])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTasksBy(date: Date) {
        
        
        let newTask = Task(id: 11, name: "тест", dateStart: date, dateFinish: date, taskDescription: "тест календаря")
        taskRealmService.saveTask(task: newTask)
        
//        var resutTasksArray: [Task] = []
//        let tasks: [Task]? = taskRealmService.getAllTasks()
//        guard let tasks = tasks else { return }
//
//        for task in tasks {
//            if isSameDay(date1: date, date2: task.dateStart) || isSameDay(date1: date, date2: task.dateFinish) {
//                resutTasksArray.append(task)
//            }
//        }
//
//        resutTasksArray.isEmpty ? print("массив пуст") : print("массив НЕ пуст")
//        print(resutTasksArray.count)
    }
}

private extension MainInteractor {
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: date1, to: date2)
        if diff.day == 0 {
            return true
        } else {
            return false
        }
    }
}
