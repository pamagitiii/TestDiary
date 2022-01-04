//
//  SceneDelegate.swift
//  TestDiary
//
//  Created by Anatoliy on 02.01.2022.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        let vc = ViewController()
        self.window!.rootViewController = vc
        self.window!.makeKeyAndVisible()
    }
}

