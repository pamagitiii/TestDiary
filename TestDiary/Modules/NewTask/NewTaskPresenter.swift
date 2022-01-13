//
//  NewTaskPresenter.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import Foundation

final class NewTaskPresenter {
    weak var view: NewTaskViewInput?
    weak var moduleOutput: NewTaskModuleOutput?
    
    private let router: NewTaskRouterInput
    private let interactor: NewTaskInteractorInput
    
    init(router: NewTaskRouterInput, interactor: NewTaskInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension NewTaskPresenter: NewTaskModuleInput {
}

extension NewTaskPresenter: NewTaskViewOutput {
    func checkSaveButtonState(startDate: Date?, endDate: Date?, taskName: String?) {
        if startDate != nil && endDate != nil && taskName != nil {
            view?.changeSaveButtonState(isEnabled: true)
        } else {
            view?.changeSaveButtonState(isEnabled: false)
        }
    }
    
    func onDoneTap() {
        moduleOutput?.newTaskModuleDidFinish()
    }
    
}

extension NewTaskPresenter: NewTaskInteractorOutput {
}

extension NewTaskPresenter: ViewToControllerOutput {
    func inputValueChanged() {
        
    }
    
}
