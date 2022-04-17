//
//  PlayerGuessingView.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

class PlayerGuessingView: UIView {
    private let playersTryTitle = CenteredCustomLabel()
    private let descriptionTitle = CenteredCustomLabel()
    private let informationAlert = CenteredCustomLabel()
    
    private let textFieldForNumber = CustomTextField()
    private let confirmButton = CustomBlueButton()
    
    private var confrimButtonAction: ButtonAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTexts()
        NotificationCenter.default.addObserver(self, selector: #selector(layoutAllSubviews), name: UIDevice.orientationDidChangeNotification, object: nil)
        layoutAllSubviews()
        confirmButton.addTarget(self, action: #selector(performAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTexts() {
        descriptionTitle.text = "You are guessing"
        confirmButton.setTitle("Guess", for: .normal)
    }
}

// MARK: - layout
extension PlayerGuessingView {
    @objc private func layoutAllSubviews() {
        addPlayersTryTitleConstraints()
        addDescriptionTitleConstraints()
        addTextFieldConstraints()
        addButtonConstraint()
        addInformationAlertConstraints()
    }
    
    private func addPlayersTryTitleConstraints() {
        playersTryTitle.removeFromSuperview()
        self.addSubview(playersTryTitle)
        playersTryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        playersTryTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            playersTryTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        } else if UIDevice.current.orientation == .landscapeLeft {
            playersTryTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .landscapeRight {
            playersTryTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .unknown {
            playersTryTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        }
    }
    
    private func addDescriptionTitleConstraints() {
        descriptionTitle.removeFromSuperview()
        self.addSubview(descriptionTitle)
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            descriptionTitle.topAnchor.constraint(equalTo: playersTryTitle.bottomAnchor, constant: 25).isActive = true
        } else if UIDevice.current.orientation == .landscapeLeft {
            descriptionTitle.topAnchor.constraint(equalTo: playersTryTitle.bottomAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .landscapeRight {
            descriptionTitle.topAnchor.constraint(equalTo: playersTryTitle.bottomAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .unknown {
            descriptionTitle.topAnchor.constraint(equalTo: playersTryTitle.bottomAnchor, constant: 25).isActive = true
        }
    }
    
    private func addTextFieldConstraints() {
        textFieldForNumber.removeFromSuperview()
        self.addSubview(textFieldForNumber)
        textFieldForNumber.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldForNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            textFieldForNumber.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 25).isActive = true
            setUpLeftRightAnchor(num: 25)
        } else if UIDevice.current.orientation == .landscapeLeft {
            textFieldForNumber.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            setUpLeftRightAnchor(num: UIScreen.main.bounds.width * 0.25)
        } else if UIDevice.current.orientation == .landscapeRight {
            textFieldForNumber.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            setUpLeftRightAnchor(num: UIScreen.main.bounds.width * 0.25)
        } else if UIDevice.current.orientation == .unknown {
            textFieldForNumber.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 25).isActive = true
            setUpLeftRightAnchor(num: 25)
        }
        
        func setUpLeftRightAnchor(num: CGFloat) {
            textFieldForNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: num).isActive = true
            textFieldForNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -num).isActive = true
        }
    }
    
    private func addButtonConstraint() {
        confirmButton.removeFromSuperview()
        self.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        confirmButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            setUpLeftAndRightAnchor(num: 25)
            confirmButton.topAnchor.constraint(equalTo: textFieldForNumber.bottomAnchor, constant: 50).isActive = true
            
        } else if UIDevice.current.orientation == .landscapeLeft {
            setUpLeftAndRightAnchor(num: UIScreen.main.bounds.width * 0.25)
            confirmButton.topAnchor.constraint(equalTo: textFieldForNumber.bottomAnchor, constant: 10).isActive = true
            
        } else if UIDevice.current.orientation == .landscapeRight {
            setUpLeftAndRightAnchor(num: UIScreen.main.bounds.width * 0.25)
            confirmButton.topAnchor.constraint(equalTo: textFieldForNumber.bottomAnchor, constant: 10).isActive = true
            
        } else if UIDevice.current.orientation == .unknown {
            setUpLeftAndRightAnchor(num: 25)
            confirmButton.topAnchor.constraint(equalTo: textFieldForNumber.bottomAnchor, constant: 50).isActive = true
        }
        
        func setUpLeftAndRightAnchor(num: CGFloat) {
            confirmButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: num).isActive = true
            confirmButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -num).isActive = true
        }
    }
    
    private func addInformationAlertConstraints() {
        informationAlert.removeFromSuperview()
        self.addSubview(informationAlert)
        informationAlert.translatesAutoresizingMaskIntoConstraints = false
        
        informationAlert.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        if UIDevice.current.orientation == .portrait {
            informationAlert.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 30).isActive = true
        } else if UIDevice.current.orientation == .landscapeLeft {
            informationAlert.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .landscapeRight {
            informationAlert.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 10).isActive = true
        } else if UIDevice.current.orientation == .unknown {
            informationAlert.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 30).isActive = true
        }
    }
}

extension PlayerGuessingView: PlayerGuessingViewProtocol {
    func addButtonAction(action: @escaping ButtonAction) {
        confrimButtonAction = action
    }
    
    func setNumberOfPlayerTries(num: Int) {
        playersTryTitle.text = "Try number \(num)"
    }
    
    func setInfromationAlert(text: String) {
        informationAlert.text = text
    }
    
    @objc private func performAction() {
        confrimButtonAction?()
    }
}
