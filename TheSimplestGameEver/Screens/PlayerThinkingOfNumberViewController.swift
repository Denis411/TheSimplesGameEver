//
//  PlayerThinkingOfNumberViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class PlayerThinkingOfNumberViewController: UIViewController {
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
}
