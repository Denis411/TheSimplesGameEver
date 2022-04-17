//
//  ComputerIsGessingViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class ComputerIsGuessingViewController: UIViewController, ComputerIsGuessingVCProtocol {
    weak var router: MainRouterProtocol!
    var presenter: ComputerIsGuessingPresenterProtocol!
    private var backgroundView: ComputerGuessingViewProtocol { view as! ComputerGuessingViewProtocol }
    
    override func loadView() {
        super.loadView()
        view = ComputerGuessingView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.setNumberOfTriesTitle(num: 4)
        backgroundView.setYourNumIsTitle(num: 5)
    }
}


protocol ComputerIsGuessingVCProtocol: AnyObject {
    
}


protocol ComputerGuessingViewProtocol {
    func setGreaterButton(action: @escaping () -> ())
    func setEqualButton(action: @escaping () -> ())
    func setLessButton(action: @escaping () -> ())
    func setNumberOfTriesTitle(num: Int)
    func setYourNumIsTitle(num: Int)
}
