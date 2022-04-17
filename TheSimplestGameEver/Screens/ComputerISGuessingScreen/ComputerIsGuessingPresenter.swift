//
//  ComputerIsGuessingPresenter.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import Foundation
import UIKit

class ComputerIsGuessingPresenter: ComputerIsGuessingPresenterProtocol {
    weak var view: ComputerIsGuessingVCProtocol?
    weak var dataContainer: DataContainerProtocol?
    
    init(view: ComputerIsGuessingVCProtocol, dataContainer: DataContainerProtocol) {
        self.view = view
        self.dataContainer = dataContainer
    }
    
    func giveComputerTries() -> Int8 {
       return dataContainer!.getComputerNumOfTries()
    }
}

protocol ComputerIsGuessingPresenterProtocol: AnyObject {
    func giveComputerTries() -> Int8
}
