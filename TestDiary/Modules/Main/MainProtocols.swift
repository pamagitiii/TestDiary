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
    func set(viewModels: [SectionViewModel])
}

protocol MainViewOutput: AnyObject {
    func viewDidLoad(calendarToday: Date)
    func didTapAddButton()
    func didSelectDate(date: Date)
    func didSelectRowWith(id: Int)
}

protocol MainInteractorInput: AnyObject {
    func updateDataBaseFromNetwork(todayDate: Date)
    func getTasksBy(date: Date)
}

protocol MainInteractorOutput: AnyObject {
    func didLoadTasks(tasks: [Task], forDate: Date)
}

protocol MainRouterInput: AnyObject {
    func presentNewTaskModule()
    func presentEditModule(taskId: Int)
}
