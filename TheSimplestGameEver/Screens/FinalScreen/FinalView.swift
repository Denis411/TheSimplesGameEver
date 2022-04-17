//
//  FinalView.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

final class FinalView: UIView {
    private let topInformationTitle = CenteredCustomLabel()
    private let stackView = UIStackView()
    private let playersScoreTitle = CenteredCustomLabel()
    private let computersScoreTitle = CenteredCustomLabel()
    private let infromationAlertTitle = CenteredCustomLabel()
    private let mainMenuButton = CustomBlueButton()
    
    private var buttonAction: ButtonAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTexts()
        layoutAllSubviews()
        setUpStackView()
        addInformationAlertConstraints()
        mainMenuButton.addTarget(self, action: #selector(performButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTexts() {
        topInformationTitle.text = "Score:"
        mainMenuButton.setTitle("Main menu", for: .normal)
        playersScoreTitle.text = "some text goes here"
        computersScoreTitle.text = "some text goes here"
        infromationAlertTitle.text = "some text goes here"
    }
    
    private func setUpStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(playersScoreTitle)
        stackView.addArrangedSubview(computersScoreTitle)
    }
}

// MARK: -- Constraintes

extension FinalView {
    private func layoutAllSubviews() {
        addTopInfoConstraints()
        addStackViewConstraints()
        mainMenuButton.setUpBottomConstraints(for: self)
        addButtonConstraints()
    }
    
    private func addTopInfoConstraints() {
        prepareForAdding(view: topInformationTitle)
        topInformationTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        topInformationTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func addStackViewConstraints() {
        prepareForAdding(view: stackView)
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func addInformationAlertConstraints() {
        prepareForAdding(view: infromationAlertTitle)
        infromationAlertTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infromationAlertTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
    }
    
    private func addButtonConstraints() {
        prepareForAdding(view: mainMenuButton)
        mainMenuButton.setUpBottomConstraints(for: self)
    }
    
    private func prepareForAdding(view: UIView) {
        view.removeFromSuperview()
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension FinalView: FinalViewProtocol {
    func setPlayerTries(num: Int8) {
        playersScoreTitle.text = "Your tries conut: \(num)"
    }
    
    func setComputerTries(num: Int8) {
        computersScoreTitle.text = "Computer's tries cound: \(num)"
    }
    
    func setInformationTitle(text: String) {
        infromationAlertTitle.text = text
    }
    
    func setButtonAction(action: @escaping ButtonAction) {
        buttonAction = action
    }
    
    @objc private func performButtonAction() {
        buttonAction?()
    }
}

