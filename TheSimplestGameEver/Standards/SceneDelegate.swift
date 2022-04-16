//
//  SceneDelegate.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        setMainViewController(scene: scene)
    }
    
    private func setMainViewController(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        let initialVC = PlayerThinkingOfNumberViewController()
        window?.rootViewController = initialVC
        window?.makeKeyAndVisible()
    }
}

