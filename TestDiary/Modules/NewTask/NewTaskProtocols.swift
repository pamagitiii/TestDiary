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
    func onDoneTap()
    func checkSaveButtonState(startDate: Date?, endDate: Date?, taskName: String?)
}

protocol NewTaskInteractorInput: AnyObject {
}

protocol NewTaskInteractorOutput: AnyObject {
}

protocol NewTaskRouterInput: AnyObject {
}

//my protocol
protocol ViewToControllerOutput: AnyObject {
    func inputValueChanged()
}
