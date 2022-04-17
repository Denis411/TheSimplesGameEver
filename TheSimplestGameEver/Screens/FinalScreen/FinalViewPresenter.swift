//
//  FinalViewPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import Foundation

final class FinalVCPresenter: FinalVCPresenterProtocol {
    weak var view: FinalVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    
    init(vc: FinalVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = vc
        self.dataContainer = dataContainer
    }
    
    func setPlayerTries() {
        guard let num = dataContainer?.getPlayerNumOfTries() else {
            return
        }
        
        view?.setPlayerTries(num: num)
    }
    
    func setComputersTries() {
        guard let num = dataContainer?.getComputerNumOfTries() else {
            return
        }
        
        view?.setComputersTries(num: num)
    }
    
    func defineWinner() -> Winner {
        guard let player = dataContainer?.getPlayerNumOfTries(),
              let computer = dataContainer?.getComputerNumOfTries() else {
                  return .none
              }
        
        if player < computer {
            return .player
        } else if player > computer {
            return .computer
        } else {
            return .none
        }
    }
}

protocol FinalVCProtocol: AnyObject {
    func setPlayerTries(num: Int8)
    func setComputersTries(num: Int8)
    func defineWinner()
}
