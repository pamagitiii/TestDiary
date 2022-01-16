//
//  AppDependency.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

//MARK: - Protocols
protocol HasTasksNetworkService {
    var tasksNetworkService: TasksNetworkProtocol { get }
}

protocol HasRealmService {
    var taskRealmService: TaskRealmProtocol { get }
}

typealias HasDependencies = HasTasksNetworkService & HasRealmService

//MARK: - AppDependency
class AppDependency {
    let networkService: NetworkService
    let realmService: RealmService
    
    init(networkService: NetworkService, realmService: RealmService) {
        self.networkService = networkService
        self.realmService = realmService
    }
    
    static func makeDefault() -> AppDependency {
        let networkService = NetworkService()
        let realmService = RealmService()
        return AppDependency(networkService: networkService, realmService: realmService)
    }
}

//MARK: - Extensions
extension AppDependency: HasTasksNetworkService {
    var tasksNetworkService: TasksNetworkProtocol {
        return networkService
    }
}

extension AppDependency: HasRealmService {
    var taskRealmService: TaskRealmProtocol {
        return realmService
    }
}
