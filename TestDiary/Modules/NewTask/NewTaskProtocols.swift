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
    func onSaveTap(taskName: String?, startDate: Date?, endDate: Date?, taskDesription: String?)
    
    func checkSaveButtonState(startDate: Date?, endDate: Date?, taskName: String?)
}

protocol NewTaskInteractorInput: AnyObject {
    func saveNewTask(taskName: String?, startDate: Date?, endDate: Date?, taskDesription: String?)
}

protocol NewTaskInteractorOutput: AnyObject {
}

protocol NewTaskRouterInput: AnyObject {
}

//my protocol
protocol ViewToControllerOutput: AnyObject {
    func inputValueChanged()
}
