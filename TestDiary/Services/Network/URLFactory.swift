//
//  URLFactory.swift
//  TestDiary
//
//  Created by Anatoliy on 13.01.2022.
//

import Foundation

enum URLFactory {
    
    static func getTasksUrl(params: TasksRequestParams) throws -> URL {
        guard let sourceUrl = Bundle.main.url(forResource: params.resourceName, withExtension: params.withExtension) else {
           // fatalError("Cant find source file in bundle")
            throw URLFactoryErrors.urlGenerationError
        }
        return sourceUrl
    }
}

enum URLFactoryErrors: Error, LocalizedError {
    
    case urlGenerationError
    
    var errorDescription: String? {
        switch self {
        case .urlGenerationError:
            return "Can't generate URL from params"
        }
    }
}
