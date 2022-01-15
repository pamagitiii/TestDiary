//
//  MainRouter.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import UIKit

final class MainRouter: BaseRouter {
    
    var dataBaseDependency: HasRealmService? //зависимость от реалма
}

extension MainRouter: MainRouterInput {
    func presentNewTaskModule() {
        guard let dataBaseDependency = dataBaseDependency else { return }
        let context = NewTaskContext(moduleDataBaseDependency: dataBaseDependency, moduleOutput: self)
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
