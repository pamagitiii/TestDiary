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
}

protocol MainInteractorInput: AnyObject {
}

protocol MainInteractorOutput: AnyObject {
}

protocol MainRouterInput: AnyObject {
}