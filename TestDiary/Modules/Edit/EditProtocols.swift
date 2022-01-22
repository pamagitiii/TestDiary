//
//  EditProtocols.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
//

import Foundation

protocol EditModuleInput {
	var moduleOutput: EditModuleOutput? { get }
}

protocol EditModuleOutput: AnyObject {
    func editModuleDidFinish()
}

protocol EditViewInput: AnyObject {
}

protocol EditViewOutput: AnyObject {
    func onCloseTap()
}

protocol EditInteractorInput: AnyObject {
}

protocol EditInteractorOutput: AnyObject {
}

protocol EditRouterInput: AnyObject {
}
