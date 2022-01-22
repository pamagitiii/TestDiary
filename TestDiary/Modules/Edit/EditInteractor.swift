//
//  EditInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

final class EditInteractor {
	weak var output: EditInteractorOutput?
    private let id: Int
    
    private let taskRealmService: TaskRealmProtocol
    
    init(taskRealmService: TaskRealmProtocol, id: Int) {
        self.taskRealmService = taskRealmService
        self.id = id
    }
}

extension EditInteractor: EditInteractorInput {
}
