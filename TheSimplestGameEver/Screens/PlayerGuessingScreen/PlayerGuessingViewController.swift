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
        updateLabels()
        pressGuessButton()
    }
    
    private func updateLabels() {
        presenter.displayNumberOfPlayersTries()
        presenter.incrementNumberOfPlayersTries()
        
        switch presenter.giveResultOfComparison() {
        case .equal:
            return
        case .greater:
            backgroundView.setInfromationAlert(text: NSLocalizedString("comp_num_greater", comment: ""))
        case .less:
            backgroundView.setInfromationAlert(text: NSLocalizedString("comp_num_less", comment: ""))
        default:
            return
        }
    }
    
    private func pressGuessButton() {
        
        backgroundView.addButtonAction { [weak self] in
            switch self?.presenter.giveResultOfComparison() {
            case .equal:
                self?.router.pushFinalVC()
            case .greater:
                self?.updateLabels()
            case .less:
                self?.updateLabels()
            default:
                fatalError("How come?")
            }
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
