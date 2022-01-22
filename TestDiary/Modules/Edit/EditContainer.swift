//
//  EditContainer.swift
//  TestDiary
//
//  Created by Anatoliy on 21.01.2022.
//  
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

final class EditContainer {
    let input: EditModuleInput
	let viewController: UIViewController
	private(set) weak var router: EditRouterInput!

	static func assemble(with context: EditContext) -> EditContainer {
        let router = EditRouter()
        let interactor = EditInteractor(taskRealmService: context.moduleDataBaseDependency.taskRealmService)
        let presenter = EditPresenter(router: router, interactor: interactor)
		let viewController = EditViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return EditContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: EditModuleInput, router: EditRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct EditContext {
    let moduleDataBaseDependency: HasRealmService
	weak var moduleOutput: EditModuleOutput?
}
