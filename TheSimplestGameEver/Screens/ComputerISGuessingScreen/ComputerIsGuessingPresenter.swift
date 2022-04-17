//
//  ComputerIsGuessingPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import Foundation
import UIKit

final class ComputerIsGuessingPresenter: ComputerIsGuessingPresenterProtocol {
    weak var view: ComputerIsGuessingVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    
    init(view: ComputerIsGuessingVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = view
        self.dataContainer = dataContainer
    }
    
    func setNumberOfComputerTries() {
        guard let computerTryedTimes = dataContainer?.getComputerNumOfTries() else {
            return
        }
        
        view?.setNumberOfTries(num: computerTryedTimes + 1)
    }
    
    func guessPlayersNumber() {
        guard let upperBound = dataContainer?.getUpperBound(),
              let lowerBound = dataContainer?.getLowerBound() else {
                  return
              }
        
        let generatedNum = Int8.random(in: lowerBound...upperBound)
        view?.setRandomNumber(num: generatedNum)
    }
    
    func setUpperBound(num: Int8) {
        dataContainer?.setUpperBound(num: num)
    }
    
    func setLowwerBound(num: Int8) {
        dataContainer?.setLowerBound(num: num)
    }
    
    func increaseNumberOfTriesByOne() {
        guard let oldTries = dataContainer?.getComputerNumOfTries() else {
            return
        }
        
        dataContainer?.setCmputerNumOfTries(num: oldTries + 1)
    }
}

protocol ComputerIsGuessingPresenterProtocol: AnyObject {
    func setNumberOfComputerTries()
    func guessPlayersNumber()
    func setUpperBound(num: Int8)
    func setLowwerBound(num: Int8)
    func increaseNumberOfTriesByOne()
}
