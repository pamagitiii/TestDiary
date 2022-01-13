//
//  URLFactory.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

enum URLFactory {
    
    static func getTasksUrl(params: TasksRequestParams) -> URL {
        guard let sourceUrl = Bundle.main.url(forResource: params.resourceName, withExtension: params.withExtension) else {
            fatalError("Cant find source file in bundle")
        }
        return sourceUrl
    }
}
