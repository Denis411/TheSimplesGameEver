//
//  PlayerGuessingPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import Foundation

final class PlayerGuessingPresenter: PlayerGuessingPresenterProtocol {
    weak var view: PlayerGuessingVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    private let randomNum = Int8.random(in: 0...100)
    private var playersNum: Int8?
    
    init(view: PlayerGuessingVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = view
        self.dataContainer = dataContainer
    }
    
    func validateString(string: String) {
        guard let num = Int8(string) else {
            view?.blockButton(isBlocked: true)
            return
        }
        
        if num > 100 || num < 0 {
            view?.blockButton(isBlocked: true)
        } else {
            playersNum = num
            view?.blockButton(isBlocked: false)
        }
    }
    
    func displayNumberOfPlayersTries() {
        guard let num = dataContainer?.getPlayerNumOfTries() else {
            fatalError("data container does not exist.")
        }
        
        view?.setNumOfPlayerTries(num: num)
    }
    
    func incrementNumberOfPlayersTries() {
        guard let oldCount = dataContainer?.getPlayerNumOfTries() else {
            return
        }
        
        dataContainer?.setPlayerNumOfTries(num: oldCount + 1)
    }
    
    func giveResultOfComparison() -> Comparison? {
        guard let playersNum = playersNum else {
            return nil
        }
        
        if playersNum > randomNum {
            return .less
        } else if playersNum < randomNum {
            return .greater
        } else {
            return .equal
        }
    }
}

protocol PlayerGuessingPresenterProtocol: AnyObject {
    func validateString(string: String)
    func displayNumberOfPlayersTries()
    func incrementNumberOfPlayersTries()
    func giveResultOfComparison() -> Comparison?
}
