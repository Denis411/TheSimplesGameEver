//
//  FinalViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

class FinalViewController: UIViewController {
    weak var router: MainRouterProtocol!
    private var backgroundView: FinalViewProtocol { view as! FinalViewProtocol }
    
    override func loadView() {
        super.loadView()
        view = FinalView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

protocol FinalViewProtocol {
    func setPlayerTries(num: Int8)
    func setComputerTries(num: Int8)
    func setInformationTitle(text: String)
    func setButtonAction(action: @escaping ButtonAction)
}
