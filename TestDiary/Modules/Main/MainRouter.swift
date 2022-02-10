//
//  MainRouter.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import UIKit

final class MainRouter: BaseRouter {
    
    var moduleDependencies: HasDependencies? //сюда передаются две зависимости
}

extension MainRouter: MainRouterInput {
    func presentEditModule(taskId: Int) {
        guard let moduleDependencies = moduleDependencies else { return }
        let context = EditContext(moduleDataBaseDependency: moduleDependencies, moduleOutput: self, taskId: taskId)
        let container = EditContainer.assemble(with: context)
        let navVC = UINavigationController(rootViewController: container.viewController)
        self.navigationController?.present(navVC, animated: true)
    }
    
    func presentNewTaskModule() {
        guard let moduleDependencies = moduleDependencies else { return }
        let context = NewTaskContext(moduleDataBaseDependency: moduleDependencies, moduleOutput: self) ///далее передаётся одна зависимость
        let container = NewTaskContainer.assemble(with: context)
        let navVC = UINavigationController(rootViewController: container.viewController)
        self.navigationController?.present(navVC, animated: true)
    }
}

extension MainRouter: NewTaskModuleOutput {
    func newTaskModuleDidFinish() {
        navigationController?.dismiss(animated: true)
    }
}

extension MainRouter: EditModuleOutput {
    func editModuleDidFinish() {
        navigationController?.dismiss(animated: true)
    }
}
