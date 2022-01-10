//
//  MainRouter.swift
//  TestDiary
//
//  Created by Anatoliy on 04.01.2022.
//  
//

import UIKit

final class MainRouter: BaseRouter {

}

extension MainRouter: MainRouterInput {
    func presentNewTaskModule() {
        let context = NewTaskContext(moduleOutput: self)
        let container = NewTaskContainer.assemble(with: context)
        let navVC = UINavigationController(rootViewController: container.viewController)
        self.navigationController?.present(navVC, animated: true)
        //viewController?.present(container.viewController, animated: true, completion: nil)
    }
}

extension MainRouter: NewTaskModuleOutput {
    func newTaskModuleDidFinish() {
        navigationController?.dismiss(animated: true)
    }
}
