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
}

protocol NewTaskViewOutput: AnyObject {
    func onDoneTap()
}

protocol NewTaskInteractorInput: AnyObject {
}

protocol NewTaskInteractorOutput: AnyObject {
}

protocol NewTaskRouterInput: AnyObject {
}
