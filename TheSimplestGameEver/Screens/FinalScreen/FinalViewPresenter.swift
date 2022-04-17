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
}

protocol FinalVCProtocol: AnyObject {
    
}
