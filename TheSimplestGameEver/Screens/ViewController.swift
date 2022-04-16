//
//  ViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {
    let gameNameTitle: CenteredCustomLabel = {
        let label = CenteredCustomLabel()
        let title = NSLocalizedString("game_name", comment: "")
        label.text = title
        return label
    }()
    
    let startButton: CustomBlueButton = {
        let button = CustomBlueButton()
        let title = NSLocalizedString("start_new_game", comment: "")
        button.setTitle(title, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        startButton.setUpBottomConstraints(for: self)
        setUpGameNameTitleConstraints()
        startButton.addTarget(self, action: #selector(openNextScreen), for: .touchUpInside)
    }
    
    private func setUpGameNameTitleConstraints() {
        view.addSubview(gameNameTitle)
        gameNameTitle.translatesAutoresizingMaskIntoConstraints = false
        gameNameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        gameNameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        gameNameTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        gameNameTitle.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    @objc private func openNextScreen() {
        
    }
}

