//
//  Router.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class MainRouter : MainRouterProtocol {
    var dataContainer: DataContainerProtocol
    var childrenRouters = [MainRouterProtocol]()
    var navController: UINavigationController
    
    init(navController: UINavigationController, dataContainer: DataContainerProtocol) {
        self.navController = navController
        self.dataContainer = dataContainer
    }
    
    func pushStartVC() {
        let startVC = StartViewController()
        startVC.router = self
        navController.pushViewController(startVC, animated: false)
    }
    
    func pushPlayerThinkingVC() {
        let playerThinkingVC = PlayerThinkingOfNumberViewController()
        playerThinkingVC.presenter = PlayerThinkingPresenter(vc: playerThinkingVC, dataContainer: dataContainer)
        playerThinkingVC.router = self
        navController.pushViewController(playerThinkingVC, animated: true)
    }
    
    func pushComputerIsGuessingVC() {
        let computerIsGuessingVC = ComputerIsGuessingViewController()
        computerIsGuessingVC.presenter = ComputerIsGuessingPresenter(view: computerIsGuessingVC, dataContainer: dataContainer)
        navController.pushViewController(computerIsGuessingVC, animated: true)
    }
}
