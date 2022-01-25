//
//  NewTaskProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import Foundation

protocol NewTaskModuleInput {
	var moduleOutput: NewTaskModuleOutput? { get }
}

protocol NewTaskModuleOutput: AnyObject {
    func newTaskModuleDidFinish()
}

protocol NewTaskViewInput: AnyObject {
    func changeSaveButtonState(isEnabled: Bool)
}

protocol NewTaskViewOutput: AnyObject {
    func onCloseTap()
    func onSaveTap(newTaskViewModel: EditTaskViewModel)
    
    func checkSaveButtonState(inputValue: EditTaskViewModel)
}

protocol NewTaskInteractorInput: AnyObject {
    func saveNewTask(newTaskViewModel: EditTaskViewModel)
}

protocol NewTaskInteractorOutput: AnyObject {
}

protocol NewTaskRouterInput: AnyObject {
}

//my protocol
protocol ViewToControllerOutput: AnyObject {
    func inputValueChanged(name: String, startDate: Date, endDate: Date, description: String?)
}
