//
//  PlayerThinkingOfNumberViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class PlayerThinkingOfNumberViewController: UIViewController {
    weak var router: MainRouterProtocol?
    var presenter: PlayerThinkingPresenterProtocol?
    
    let enterNumberButton: CustomBlueButton = {
        let button = CustomBlueButton()
        let title = NSLocalizedString("enter_the_number", comment: "")
        button.setTitle(title, for: .normal)
        return button
    }()
    
    let textFieldForNumber = CustomTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        NotificationCenter.default.addObserver(self, selector: #selector(validateString), name: UITextField.textDidChangeNotification , object: nil)
        
        enterNumberButton.addTarget(self, action: #selector(openNextVC), for: .touchUpInside)
        enterNumberButton.blockButton(true)
        enterNumberButton.setUpBottomConstraints(for: self)
        setUpTextFieldConstraints()
    }
    
    private func setUpTextFieldConstraints() {
        view.addSubview(textFieldForNumber)
        textFieldForNumber.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldForNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textFieldForNumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldForNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        textFieldForNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    @objc private func openNextVC() {
        presenter?.savePlayersNum(string: textFieldForNumber.text)
        router?.pushThirdVC()
    }
    
    @objc private func validateString() {
        presenter?.validateString(string: textFieldForNumber.text!)
    }
    
}

extension PlayerThinkingOfNumberViewController: PlayerThikingVCProtocol {
    func blockButton(isBlocked: Bool) {
        enterNumberButton.blockButton(isBlocked)
    }
}

protocol PlayerThikingVCProtocol: AnyObject {
    func blockButton(isBlocked: Bool)
}
