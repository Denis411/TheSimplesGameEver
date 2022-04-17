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
        backgroundView.blockButton(isBlocked: true)
        backgroundView.setDelegate(delegate: self)
        backgroundView.setNumberOfPlayerTries(num: 5)
        backgroundView.setInfromationAlert(text: "Info")
        openToNextVC()
    }
    
    private func openToNextVC() {
        backgroundView.addButtonAction { [weak self] in
            self?.router.pushFinalVC()
        }
    }
}

extension PlayerGuessingViewController: PlayerGuessingViewDelegate {
    func validateInput(text: String) {
        presenter?.validateString(string: text)
    }
}

extension PlayerGuessingViewController: PlayerGuessingVCProtocol {
    func blockButton(isBlocked: Bool) {
        backgroundView.blockButton(isBlocked: isBlocked)
    }
}

protocol PlayerGuessingVCProtocol: AnyObject {
    func blockButton(isBlocked: Bool)
}

protocol PlayerGuessingViewProtocol: AnyObject {
    func setDelegate(delegate: PlayerGuessingViewDelegate)
    func addButtonAction(action: @escaping ButtonAction)
    func setNumberOfPlayerTries(num: Int)
    func setInfromationAlert(text: String)
    func blockButton(isBlocked: Bool)
}
