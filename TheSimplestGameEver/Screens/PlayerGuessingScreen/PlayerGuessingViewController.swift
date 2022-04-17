//
//  PlayerGuessingViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

class PlayerGuessingViewController: UIViewController {
    weak var router: MainRouterProtocol!
    private var backgroundView: PlayerGuessingViewProtocol { view as! PlayerGuessingViewProtocol }
    
    override func loadView() {
        super.loadView()
        view = PlayerGuessingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backgroundView.setNumberOfPlayerTries(num: 5)
        backgroundView.setInfromationAlert(text: "Info")
        backgroundView.addButtonAction { [weak self] in
            self?.router.pushFinalVC()
        }
    }
}

protocol PlayerGuessingViewProtocol {
    func addButtonAction(action: @escaping ButtonAction)
    func setNumberOfPlayerTries(num: Int)
    func setInfromationAlert(text: String)
}
