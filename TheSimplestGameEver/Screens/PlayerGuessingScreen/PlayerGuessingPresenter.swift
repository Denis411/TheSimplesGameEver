//
//  PlayerGuessingPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import Foundation

final class PlayerGuessingPresenter: PlayerGuessingPresenterProtocol {
    var view: PlayerGuessingVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    
    init(view: PlayerGuessingVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = view
        self.dataContainer = dataContainer
    }
    
    func validateString(string: String) {
        guard let num = Int(string) else {
            view?.blockButton(isBlocked: true)
            return
        }
        
        if num > 100 || num < 0 {
            view?.blockButton(isBlocked: true)
        } else {
            view?.blockButton(isBlocked: false)
        }
    }
}

protocol PlayerGuessingPresenterProtocol: AnyObject {
    func validateString(string: String)
}
