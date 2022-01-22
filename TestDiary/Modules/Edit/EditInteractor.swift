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
    
    private let taskRealmService: TaskRealmProtocol
    
    init(taskRealmService: TaskRealmProtocol) {
        self.taskRealmService = taskRealmService
    }
}

extension EditInteractor: EditInteractorInput {
}
