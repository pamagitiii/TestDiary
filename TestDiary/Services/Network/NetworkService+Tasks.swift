//
//  NetworkService+Tasks.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

extension NetworkService: TasksNetworkProtocol {
    func requestTasks(params: TasksRequestParams, completion: @escaping (Result<TasksRespose, Error>) -> Void) {
        
        let url = URLFactory.getTasksUrl(params: params)
        baseRequest(url: url, completion: completion)
    }
}
