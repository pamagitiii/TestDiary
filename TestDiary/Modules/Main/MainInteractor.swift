//
//  MainInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

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
                print(error.localizedDescription) ///надо дописать что делать, если не получилось получить дату из json
            }
        }
    }
    
}
