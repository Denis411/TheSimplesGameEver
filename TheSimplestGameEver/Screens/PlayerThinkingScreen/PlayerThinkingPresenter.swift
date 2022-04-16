//
//  PlayerThinkingPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import Foundation
import UIKit

class PlayerThinkingPresenter: PlayerThinkingPresenterProtocol {
    weak var view: PlayerThikingVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    
    init(vc: PlayerThikingVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = vc
    }
    
    convenience init(vc: PlayerThikingVCProtocol) {
        let dataContainer = DataContainer.shared
        self.init(vc: vc, dataContainer: dataContainer)
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
    
    func savePlayersNum(string: String?) {
        guard let num = Int8(string ?? "Not valid num") else {
            fatalError("Invalid string")
        }
        
        dataContainer?.setPlayersNumber(num: num)
    }
}

protocol PlayerThinkingPresenterProtocol: AnyObject {
    var view: PlayerThikingVCProtocol? { get set }
    var dataContainer: DataContainerProtocol? { get set }
    func validateString(string: String)
    func savePlayersNum(string: String?)
}
