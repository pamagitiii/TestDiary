//
//  EditPresenter.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

final class EditPresenter {
	weak var view: EditViewInput?
    weak var moduleOutput: EditModuleOutput?
    
	private let router: EditRouterInput
	private let interactor: EditInteractorInput
    
    init(router: EditRouterInput, interactor: EditInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension EditPresenter: EditModuleInput {
    
}

extension EditPresenter: EditViewOutput {
    func onCloseTap() {
        moduleOutput?.editModuleDidFinish()
    }
    
}

extension EditPresenter: EditInteractorOutput {
}
