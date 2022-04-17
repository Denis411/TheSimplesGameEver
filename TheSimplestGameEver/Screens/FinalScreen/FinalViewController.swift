//
//  FinalViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

class FinalViewController: UIViewController {
    weak var router: MainRouterProtocol!
    var presenter: FinalVCPresenterProtocol?
    private var backgroundView: FinalViewProtocol { view as! FinalViewProtocol }
    
    override func loadView() {
        super.loadView()
        view = FinalView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.setPlayerTries()
        presenter?.setComputersTries()
        defineWinner()
        backgroundView.setButtonAction { [unowned self] in
            self.presenter?.nolifyCounter()
            self.router.pushStartVC()
        }
    }
}

extension FinalViewController: FinalVCProtocol {
    func defineWinner() {
        guard let winner = presenter?.defineWinner() else {
            return
        }
        
        var infoText: String = "none"
        
        switch winner {
        case .player:
            infoText = NSLocalizedString("you_win", comment: "")
        case .computer:
            infoText = NSLocalizedString("computer_wins", comment: "")
        case .none:
            infoText = NSLocalizedString("no_winner", comment: "")
        }
        
        backgroundView.setInformationTitle(text: infoText)
    }
    
    func setPlayerTries(num: Int8) {
        backgroundView.setPlayerTries(num: num)
    }
    
    func setComputersTries(num: Int8) {
        backgroundView.setComputerTries(num: num)
    }
}

protocol FinalVCPresenterProtocol: AnyObject {
    func setPlayerTries()
    func setComputersTries()
    func defineWinner() -> Winner
    func nolifyCounter()
}

protocol FinalViewProtocol {
    func setPlayerTries(num: Int8)
    func setComputerTries(num: Int8)
    func setInformationTitle(text: String)
    func setButtonAction(action: @escaping ButtonAction)
}
