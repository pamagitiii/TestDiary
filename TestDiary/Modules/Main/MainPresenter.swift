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
    
    init(router: MainRouterInput, interactor: MainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainPresenter: MainModuleInput {
}

extension MainPresenter: MainViewOutput {
    func viewDidLoad() {
        interactor.updateDataBaseFromWeb()
    }
    
    func didTapAddButton() {
        router.presentNewTaskModule()
    }
    
}

extension MainPresenter: MainInteractorOutput {
}
