//
//  MainProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import Foundation

protocol MainModuleInput {
	var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
}

protocol MainViewOutput: AnyObject {
    func viewDidLoad()
    func didTapAddButton()
    func didSelectDate(date: Date)
}

protocol MainInteractorInput: AnyObject {
    func updateDataBaseFromNetwork()
    func getTasksBy(date: Date)
}

protocol MainInteractorOutput: AnyObject {
}

protocol MainRouterInput: AnyObject {
    func presentNewTaskModule()
}
