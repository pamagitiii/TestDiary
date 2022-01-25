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
    
    func checkSaveButtonState(inputValue: EditTaskViewModel) {
        if inputValue.name != "" && inputValue.endDate > inputValue.startDate {
            view?.changeSaveButtonState(isEnabled: true)
        } else {
            view?.changeSaveButtonState(isEnabled: false)
        }
        
//        if startDate != nil && endDate != nil && taskName != nil {
//            view?.changeSaveButtonState(isEnabled: true)
//        } else {
//            view?.changeSaveButtonState(isEnabled: false)
//        }
    }
    
    func onSaveTap(newTaskViewModel: EditTaskViewModel) {
        interactor.saveNewTask(newTaskViewModel: newTaskViewModel)
        moduleOutput?.newTaskModuleDidFinish()
    }
    
    func onCloseTap() {
        moduleOutput?.newTaskModuleDidFinish()
    }
}

extension NewTaskPresenter: NewTaskInteractorOutput {
}
