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
}

protocol EditViewOutput: AnyObject {
    func viewWillAppear()
    func onCloseTap()
    func onDeleteTap()
}

protocol EditInteractorInput: AnyObject {
    func getTask()
    func deleteTask()
}

protocol EditInteractorOutput: AnyObject {
    func didLoadTask(task: Task)
}

protocol EditRouterInput: AnyObject {
}
