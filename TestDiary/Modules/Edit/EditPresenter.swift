//
//  EditPresenter.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

final class EditPresenter {
	weak var view: EditViewInput?
    weak var moduleOutput: EditModuleOutput?
    
	private let router: EditRouterInput
	private let interactor: EditInteractorInput
    
    init(router: EditRouterInput, interactor: EditInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension EditPresenter: EditModuleInput {
    
}

extension EditPresenter: EditViewOutput {
    func onSaveTap(editedTaskViewModel: EditTaskViewModel) {
        interactor.updateTask(editedTaskViewModel: editedTaskViewModel)
        moduleOutput?.editModuleDidFinish()
    }
    
    func checkSaveButtonState(inputValue: EditTaskViewModel) {
        inputValue.name.isValid() ? view?.changeSaveButtonState(isEnabled: true) : view?.changeSaveButtonState(isEnabled: false)
    }
    
    func onDeleteTap() {
        interactor.deleteTask()
        moduleOutput?.editModuleDidFinish()
    }
    
    func viewWillAppear() {
        interactor.getTask()
    }
    
    func onCloseTap() {
        moduleOutput?.editModuleDidFinish()
    }
    
}

extension EditPresenter: EditInteractorOutput {
    func didLoadTask(task: Task) {
        view?.updateViewWith(viewModel: EditTaskViewModel(name: task.name,
                                                        startDate: task.dateStart,
                                                        endDate: task.dateFinish,
                                                        description: task.taskDescription))
    }
    
}
