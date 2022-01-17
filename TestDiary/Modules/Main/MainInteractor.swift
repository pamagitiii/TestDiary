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
        var resutTasksArray: [Task] = []
        
        let realmTasks: [Task]? = taskRealmService.getAllTasks()
        guard let realmTasks = realmTasks else { return }
        let inputDayDateInterval = DateInterval(start: date, duration: 82800 + 3540 + 59) //интрвал с начала дня + 23ч 59мин 59сек
        
        for task in realmTasks {
            let tasksDateInterval = DateInterval(start: task.dateStart, end: task.dateFinish) //интервал с начала задачи до окончания
            if tasksDateInterval.intersects(inputDayDateInterval) {
                resutTasksArray.append(task)
            }
            
        }
        
        if resutTasksArray.isEmpty == false {
            print("Дела в этот день:")
            for i in resutTasksArray {
                print(i.name)
            }
        }

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
