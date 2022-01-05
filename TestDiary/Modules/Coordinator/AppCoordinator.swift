//
//  AppCoordinator.swift
//  TestDiary
//
//  Created by Anatoliy on 05.01.2022.
//

import UIKit
import CloudKit

class AppCoordinator {
    
    private let window: UIWindow
    
    private lazy var navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
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
        let context = MainContext(moduleOutput: nil)
        let container = MainContainer.assemble(with: context)
        navigationController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = "Ежедневник"
        /*
        let context = FeedContext(moduleDependencies: self.appDependency,
                                  moduleOutput: nil)
        let container = FeedContainer.assemble(with: context)
        navController.setViewControllers([container.viewController], animated: false)
        container.viewController.navigationItem.title = NavControllerType.feed.title
         */
    }
    
    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        let blueColor = UIColor.systemBlue
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: blueColor]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: blueColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        /*
         UINavigationBar.appearance().barTintColor = .white
         UINavigationBar.appearance().tintColor = .black
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
         UINavigationBar.appearance().isTranslucent = false
         UINavigationBar.appearance().shadowImage = UIImage()
         
         
         
         UITabBar.appearance().barTintColor = .white
         UITabBar.appearance().tintColor = Styles.Color.appGreen
         */
        
        /*
         if #available(iOS 15, *) {
         let appearance = UINavigationBarAppearance()
         appearance.configureWithOpaqueBackground()
         appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
         appearance.backgroundColor = .green
         UINavigationBar.appearance().standardAppearance = appearance
         UINavigationBar.appearance().scrollEdgeAppearance = appearance// UINavigationBar().standardAppearance
         }
         */
    }
}

/*
 if #available(iOS 15, *) {
 let appearance = UINavigationBarAppearance()
 appearance.configureWithOpaqueBackground()
 appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
 appearance.backgroundColor = .green
 UINavigationBar.appearance().standardAppearance = appearance
 UINavigationBar.appearance().scrollEdgeAppearance = appearance// UINavigationBar().standardAppearance
 }
 */
