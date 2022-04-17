//
//  RouterProtocol.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    var dataContainer: DataContainerProtocol { get set }
    var childrenRouters: [MainRouterProtocol] { get set }
    var navController: UINavigationController { get set }
    
    func pushStartVC()
    func pushPlayerThinkingVC()
    func pushComputerIsGuessingVC()
    func pushPlayerGuessingVC()
    func pushFinalVC()
}
