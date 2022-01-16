//
//  MainContainer.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
// swiftlint:disable implicitly_unwrapped_optional

import UIKit

final class MainContainer {
    let input: MainModuleInput
    let viewController: UIViewController
    private(set) weak var router: MainRouterInput!
    
    static func assemble(with context: MainContext) -> MainContainer {
        let router = MainRouter()
        let interactor = MainInteractor(tasksNetworkService: context.moduleDependencies.tasksNetworkService,
                                        taskRealmService: context.moduleDependencies.taskRealmService)
        let presenter = MainPresenter(router: router, interactor: interactor)
        let viewController = MainViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        router.navigationControllerProvider = { [weak viewController] in
            viewController?.navigationController
        }
        
        router.moduleDependencies = context.moduleDependencies //передаём роутеру зависимости для передачи в след. модуль
        
        return MainContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: MainModuleInput, router: MainRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct MainContext {
    let moduleDependencies: HasDependencies //завсисмости этого модуля
    weak var moduleOutput: MainModuleOutput?
}
