//
//  AppDependency.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

protocol HasTasksNetworkService {
    var tasksNetworkService: TasksNetworkProtocol { get }
}

class AppDependency {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    static func makeDefault() -> AppDependency {
        let networkService = NetworkService()
        return AppDependency(networkService: networkService)
    }
}

extension AppDependency: HasTasksNetworkService {
    var tasksNetworkService: TasksNetworkProtocol {
        return networkService
    }
}
