//
//  NetworkServiceProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

struct TasksRequestParams {
    let resourceName: String
    let withExtension: String
}

protocol TasksNetworkProtocol {
    func requestTasks(params: TasksRequestParams, completion: @escaping (Result<TasksRespose, Error>) -> Void)
}

struct TasksRespose: Decodable {
    let tasks: [Task]
}
