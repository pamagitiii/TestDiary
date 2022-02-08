//
//  MainPresenter.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import Foundation

final class MainPresenter {
    weak var view: MainViewInput?
    weak var moduleOutput: MainModuleOutput?
    
    private let router: MainRouterInput
    private let interactor: MainInteractorInput
    private let formatter = DateFormatter()
    
    init(router: MainRouterInput, interactor: MainInteractorInput) {
        self.router = router
        self.interactor = interactor
        
        formatter.timeZone = TimeZone(abbreviation: "UTC+3") //отображение дат в Московском часовом поясе
    }
}

extension MainPresenter: MainModuleInput {
}

extension MainPresenter: MainViewOutput {
    
    func didSelectRowWith(id: Int) {
        router.presentEditModule(taskId: id)
    }
    
    func viewDidLoad(calendarToday: Date) {
        interactor.updateDataBaseFromNetwork(todayDate: calendarToday)
    }
    
    func didTapAddButton() {
        router.presentNewTaskModule()
    }
    
    func didSelectDate(date: Date) {
        interactor.getTasksBy(date: date)
    }
}

extension MainPresenter: MainInteractorOutput {
    func didLoadTasks(tasks: [Task], forDate: Date) {
        let viewModels = makeViewModels(for: tasks, date: forDate)
        view?.set(viewModels: viewModels)
    }
}

private extension MainPresenter {
    
    private func makeViewModels(for tasks: [Task], date: Date) -> [SectionViewModel] {
        var date = date
        let tasks = tasks
        var result: [SectionViewModel] = []
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        for _ in (0..<24) {
            //создаём интервал одного часа из нажатого дня
            let interval = DateInterval(start: Calendar.current.date(byAdding: .second, value: 1, to: date) ?? Date(),
                                        end: Calendar.current.date(byAdding: .second, value: 3599, to: date) ?? Date())

            //генерируем заголовок для секции
            formatter.dateFormat = "HH:mm"
            let nextHour = Calendar.current.date(byAdding: .hour, value: 1, to: date) ?? Date()
            let sectionTitle = formatter.string(from: date) + " - " + formatter.string(from: nextHour)
            //создаём секцию
            var newSection = SectionViewModel(headetTitleText: sectionTitle, cellViewModels: [])
            
            for task in tasks {
                let taskInterval = DateInterval(start: task.dateStart, end: task.dateFinish) //создаём интервал задачи
                
                if taskInterval.intersects(interval) {
                    formatter.dateFormat = "d MMM, HH:mm"
                    let newCell = CellViewModel(id: task.id,
                                                taskNameText: task.name,
                                                startDateText: formatter.string(from: task.dateStart),
                                                endDateText: formatter.string(from: task.dateFinish))
                    newSection.cellViewModels.append(newCell)
                }
            }
            
            if !newSection.cellViewModels.isEmpty {
                result.append(newSection)
            }
            date = Calendar.current.date(byAdding: .hour, value: 1, to: date) ?? Date()
        }
        return result
    }
}

///первая версия алгоритма для  формирования вьюмоделей
/*
 var date = date
 let tasks = tasks
 
 var result: [SectionViewModel] = []
 
 formatter.dateFormat = "dd-MM-yyyy HH:mm"
 
 for _ in (0..<24) {
 
 //создаём интервал одного часа из нажатого дня
 //let interval = DateInterval(start: date, duration: 59)
 let interval = DateInterval(start: date, end: Calendar.current.date(byAdding: .hour, value: 1, to: date) ?? Date())
 
 //генерируем заголовок для секции
 formatter.dateFormat = "HH:mm"
 let nextHour = Calendar.current.date(byAdding: .hour, value: 1, to: date) ?? Date()
 let sectionTitle = formatter.string(from: date) + " - " + formatter.string(from: nextHour)
 
 //создаём секцию
 var newSection = SectionViewModel(headetTitleText: sectionTitle, cellViewModels: [])
 
 for task in tasks {
 
 let taskInterval = DateInterval(start: task.dateStart, end: task.dateFinish) //создаём интервал задачи
 
 let isLastCell: Bool = compare(firstDate: date, secondDate: task.dateFinish)
 
 if taskInterval.intersects(interval) && isLastCell == false {
 
 formatter.dateFormat = "d MMM, HH:mm"
 let newCell = CellViewModel(id: task.id,
 taskNameText: task.name,
 startDateText: formatter.string(from: task.dateStart),
 endDateText: formatter.string(from: task.dateFinish))
 newSection.cellViewModels.append(newCell)
 }
 }
 
 if !newSection.cellViewModels.isEmpty {
 result.append(newSection)
 }
 date = Calendar.current.date(byAdding: .hour, value: 1, to: date) ?? Date()
 }
 return result
 */

//вспомогательная функция для первой версии алгоритма
/*
 func compare(firstDate: Date, secondDate: Date) -> Bool {
 //formatter.string(from: firstDate) == formatter.string(from: secondDate)
 //formatter.dateFormat = "d MMM, HH:mm"
 if firstDate == secondDate {
 return true
 }
 return false
 
 }
 */
