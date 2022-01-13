//
//  SceneDelegate.swift
//  TestDiary
//
//  Created by Anatoliy on 02.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private lazy var appDependency: AppDependency = AppDependency.makeDefault()
    
    private var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(window: window, appDependency: self.appDependency)
        self.window = window
        appCoordinator?.start()
    }
}
