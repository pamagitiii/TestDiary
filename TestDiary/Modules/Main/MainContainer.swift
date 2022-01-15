//
//  MainContainer.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import UIKit

final class MainContainer {
    let input: MainModuleInput
	let viewController: UIViewController
	private(set) weak var router: MainRouterInput!

	static func assemble(with context: MainContext) -> MainContainer {
        let router = MainRouter()
        let interactor = MainInteractor(tasksNetworkService: context.moduleNetworkDependency.tasksNetworkService,
                                        taskRealmService: context.moduleDataBaseDependency.taskRealmService)
        let presenter = MainPresenter(router: router, interactor: interactor)
		let viewController = MainViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.navigationControllerProvider = { [weak viewController] in
            viewController?.navigationController
        }
        
        router.dataBaseDependency = context.moduleDataBaseDependency // передаём роутеру одну зависимость от реалма

        return MainContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: MainModuleInput, router: MainRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct MainContext {
//    typealias ModuleDependencies = HasTasksNetworkService
//    let moduleDependencies: ModuleDependencies
//	weak var moduleOutput: MainModuleOutput?
    
    //typealias ModuleDependencies = HasTasksNetworkService
    let moduleNetworkDependency: HasTasksNetworkService
    let moduleDataBaseDependency: HasRealmService
    weak var moduleOutput: MainModuleOutput?
      }
