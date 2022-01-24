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
    
    //при загруке контроллера приходит сегодняшняя дата с календаря, при тапе по календарю - выбранная юзером дата
    private var chosenDate: Date
    
    init(tasksNetworkService: TasksNetworkProtocol, taskRealmService: TaskRealmProtocol) {
        self.tasksNetworkService = tasksNetworkService
        self.taskRealmService = taskRealmService
        
        self.chosenDate = Date()
        
        self.taskRealmService.subscribeToTasksNotifications()
        self.taskRealmService.notificationCenter?.addObserver(self,
                                                              selector: #selector(dataBaseUpdated),
                                                              name: Notification.Name("DataBaseUpdated"),
                                                              object: nil)
    }
}

extension MainInteractor: MainInteractorInput {
    
    func updateDataBaseFromNetwork(todayDate: Date) {
        
        chosenDate = todayDate
        
        let params = TasksRequestParams(resourceName: "MockData", withExtension: "json")
        tasksNetworkService.requestTasks(params: params) { [weak self] result in
            
            switch result {
            case .success(let response):
                
                guard let self = self else { return }
                
                self.taskRealmService.saveTasks(tasks: response.tasks)
                
                self.getTasksBy(date: self.chosenDate)
                
                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                print(paths[0])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTasksBy(date: Date) {
        chosenDate = date
        
        var resutTasksArray: [Task] = []
        let realmTasks: [Task]? = taskRealmService.getAllTasks()
        let inputDayDateInterval = DateInterval(start: date, duration: 82800 + 3540 + 59) //интрвал с начала дня + 23ч 59мин 59сек

        guard let realmTasks = realmTasks else { return }
        for task in realmTasks {
            let tasksDateInterval = DateInterval(start: task.dateStart, end: task.dateFinish) //интервал с начала задачи до окончания
            if tasksDateInterval.intersects(inputDayDateInterval) {
                resutTasksArray.append(task)
            }
        }
        output?.didLoadTasks(tasks: resutTasksArray, forDate: chosenDate)
    }
}

private extension MainInteractor {
    @objc func dataBaseUpdated() {
        print("база данных изменена")
        getTasksBy(date: chosenDate)
    }
}
