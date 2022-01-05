//
//  NewTaskInteractor.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
//

import Foundation

final class NewTaskInteractor {
	weak var output: NewTaskInteractorOutput?
}

extension NewTaskInteractor: NewTaskInteractorInput {
}
