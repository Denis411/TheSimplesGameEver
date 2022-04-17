//
//  PlayerGuessingViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

final class PlayerGuessingViewController: UIViewController {
    weak var router: MainRouterProtocol!
    var presenter: PlayerGuessingPresenterProtocol!
    private var backgroundView: PlayerGuessingViewProtocol { view as! (PlayerGuessingViewProtocol & PlayerGuessingViewDelegate)}
    
    override func loadView() {
        super.loadView()
        view = PlayerGuessingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.setNumberOfPlayersTries()
        backgroundView.blockButton(isBlocked: true)
        backgroundView.setDelegate(delegate: self)
        backgroundView.setInfromationAlert(text: "Info")
        openToNextVC()
    }
    
    private func openToNextVC() {
        presenter.incrementNumberOfPlayersTries()
        backgroundView.addButtonAction { [weak self] in
            self?.router.pushFinalVC()
        }
    }
}

extension PlayerGuessingViewController: PlayerGuessingViewDelegate {
    func validateInput(text: String) {
        presenter.validateString(string: text)
    }
}

extension PlayerGuessingViewController: PlayerGuessingVCProtocol {
    func blockButton(isBlocked: Bool) {
        backgroundView.blockButton(isBlocked: isBlocked)
    }
    
    func setNumOfPlayerTries(num: Int8) {
        backgroundView.setNumberOfPlayerTries(num: num + 1)
    }
}

protocol PlayerGuessingVCProtocol: AnyObject {
    func blockButton(isBlocked: Bool)
    func setNumOfPlayerTries(num: Int8)
}

protocol PlayerGuessingViewProtocol: AnyObject {
    func setDelegate(delegate: PlayerGuessingViewDelegate)
    func addButtonAction(action: @escaping ButtonAction)
    func setNumberOfPlayerTries(num: Int8)
    func setInfromationAlert(text: String)
    func blockButton(isBlocked: Bool)
}
