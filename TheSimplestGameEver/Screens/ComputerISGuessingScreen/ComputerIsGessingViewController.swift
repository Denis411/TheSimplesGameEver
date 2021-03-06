//
//  ComputerIsGessingViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

final class ComputerIsGuessingViewController: UIViewController {
    weak var router: MainRouterProtocol!
    var presenter: ComputerIsGuessingPresenterProtocol!
    private var backgroundView: ComputerGuessingViewProtocol { view as! ComputerGuessingViewProtocol }
    private var randomNum: Int8 = 100
    
    override func loadView() {
        super.loadView()
        view = ComputerGuessingView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pressEqualButton()
        updateLabels()
        setGreaterThanButtonAction()
        setLessThanButtonAction()
    }
    
    private func updateLabels() {
        presenter.setNumberOfComputerTries()
        presenter.guessPlayersNumber()
    }
    
    private func pressEqualButton() {
        backgroundView.setEqualButton { [unowned self] in
            print("player's number is \(randomNum)")
            presenter.setLowwerBound(num: 0)
            presenter.setUpperBound(num: 100)
            self.router.pushPlayerGuessingVC()
        }
    }
    
    private func setGreaterThanButtonAction() {
        backgroundView.setGreaterButton { [unowned self] in
            print("Greater than \(randomNum)")
            self.presenter.setLowwerBound(num: self.randomNum)
            self.updateLabels()
        }
    }
    
    private func setLessThanButtonAction() {
        backgroundView.setLessButton { [unowned self] in
            print("less than \(randomNum)")
            self.presenter.setUpperBound(num: self.randomNum)
            self.updateLabels()
        }
    }
}

extension ComputerIsGuessingViewController: ComputerIsGuessingVCProtocol {
    func setNumberOfTries(num: Int8) {
        backgroundView.setNumberOfComputerTries(num: num)
        presenter.increaseNumberOfTriesByOne()
    }
    
    func setRandomNumber(num: Int8) {
        backgroundView.setYourNumIsTitle(num: num)
        self.randomNum = num
    }
}


protocol ComputerIsGuessingVCProtocol: AnyObject {
    func setNumberOfTries(num: Int8)
    func setRandomNumber(num: Int8)
}

protocol ComputerGuessingViewProtocol {
    func setGreaterButton(action: @escaping () -> ())
    func setEqualButton(action: @escaping () -> ())
    func setLessButton(action: @escaping () -> ())
    func setNumberOfComputerTries(num: Int8)
    func setYourNumIsTitle(num: Int8)
}
