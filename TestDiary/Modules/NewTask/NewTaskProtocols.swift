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

protocol NewTaskModuleOutput: class {
}

protocol NewTaskViewInput: class {
}

protocol NewTaskViewOutput: class {
}

protocol NewTaskInteractorInput: class {
}

protocol NewTaskInteractorOutput: class {
}

protocol NewTaskRouterInput: class {
}
