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
    
    init(tasksNetworkService: TasksNetworkProtocol) {
        self.tasksNetworkService = tasksNetworkService
    }
}

extension MainInteractor: MainInteractorInput {
    func updateDataBaseFromWeb() {
        let params = TasksRequestParams(resourceName: "MockData", withExtension: "json")
        tasksNetworkService.requestTasks(params: params) { [weak self] result in
            
            switch result {
            case .success(let response):
                print(response.tasks.count)
            case .failure(let error):
                print(error.localizedDescription) ///надо дописать что делать, если не получилось получить дату из json
            }
        }
    }
    
}
