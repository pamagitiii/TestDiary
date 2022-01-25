//
//  EditProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

protocol EditModuleInput {
	var moduleOutput: EditModuleOutput? { get }
}

protocol EditModuleOutput: AnyObject {
    func editModuleDidFinish()
}

protocol EditViewInput: AnyObject {
    func updateViewWith(viewModel: EditTaskViewModel)
    func changeSaveButtonState(isEnabled: Bool)
}

protocol EditViewOutput: AnyObject {
    func viewWillAppear()
    func onCloseTap()
    func onDeleteTap()
    func onSaveTap(editedTaskViewModel: EditTaskViewModel)
    func checkSaveButtonState(inputValue: EditTaskViewModel)
}

protocol EditInteractorInput: AnyObject {
    func getTask()
    func deleteTask()
    func updateTask(editedTaskViewModel: EditTaskViewModel)
}

protocol EditInteractorOutput: AnyObject {
    func didLoadTask(task: Task)
}

protocol EditRouterInput: AnyObject {
}
