//
//  NetworkService+Tasks.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//
// swiftlint:disable no_direct_standard_out_logs

import Foundation

extension NetworkService: TasksNetworkProtocol {
    func requestTasks(params: TasksRequestParams, completion: @escaping (Result<TasksRespose, Error>) -> Void) {
        do {
        let url = try URLFactory.getTasksUrl(params: params)
        baseRequest(url: url, completion: completion)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
