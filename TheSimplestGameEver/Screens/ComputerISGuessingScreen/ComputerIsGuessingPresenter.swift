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
    private var upperBound: Int8 = 0
    private var lowwerBound: Int8 = 100
    
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
        let generatedNum = Int8.random(in: upperBound...lowwerBound)
        view?.setRandomNumber(num: generatedNum)
    }
    
    func setUpperBound(num: Int8) {
        upperBound = num
    }
    
    func setLowwerBound(num: Int8) {
        lowwerBound = num
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
