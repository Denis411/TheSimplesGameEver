//
//  SceneDelegate.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var router: MainRouterProtocol?
    var dataContainer: DataContainerProtocol?
    var navController: UINavigationController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        initVariables()
        setInitialVC(scene: scene)
    }
    
    private func setInitialVC(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        router?.pushStartVC()
    }
    
    private func initVariables() {
        dataContainer = DataContainer(playersNumber: 0, computersNumber: 0)
        navController = UINavigationController()
        navController?.navigationBar.isHidden = true
        router = MainRouter(navController: navController!, dataContainer: dataContainer as! DataContainerProtocol)
    }
}

