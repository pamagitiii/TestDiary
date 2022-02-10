//
//  NewTaskContainer.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//  
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

final class NewTaskContainer {
    
    let input: NewTaskModuleInput
	let viewController: UIViewController
	private(set) weak var router: NewTaskRouterInput!

	static func assemble(with context: NewTaskContext) -> NewTaskContainer {
        let router = NewTaskRouter()
        let interactor = NewTaskInteractor(taskRealmService: context.moduleDataBaseDependency.taskRealmService) //
        let presenter = NewTaskPresenter(router: router, interactor: interactor)
		let viewController = NewTaskViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return NewTaskContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: NewTaskModuleInput, router: NewTaskRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}

}

struct NewTaskContext {
    let moduleDataBaseDependency: HasRealmService
	weak var moduleOutput: NewTaskModuleOutput?
}
