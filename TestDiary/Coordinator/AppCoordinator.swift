//
//  AppCoordinator.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//

import UIKit
import CloudKit

class AppCoordinator {
    
    private let appDependency: AppDependency
    private let window: UIWindow
    private lazy var navigationController = UINavigationController()
    
    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
        setupAppearance()
    }
    
    func start() {
        setupMainModule()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func setupMainModule() {
        let context = MainContext(moduleDependencies: self.appDependency, moduleOutput: nil)
        let container = MainContainer.assemble(with: context)
        navigationController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = "Diary"
    }
    
    func setupAppearance() {
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            
            appearance.configureWithOpaqueBackground()
            let blueColor = UIColor.systemBlue
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: blueColor]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: blueColor]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}
