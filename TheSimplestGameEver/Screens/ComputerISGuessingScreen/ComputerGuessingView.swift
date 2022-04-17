//
//  ComputerGuessingView.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 17.04.2022.
//

import UIKit

typealias ButtonAction = () -> ()

final class ComputerGuessingView: UIView {
    private let tryNumberLabel = CenteredCustomLabel()
    private let computerIsGuessingNumber = CenteredCustomLabel()
    private let yourNumIs = CenteredCustomLabel()
    private let myNumberIs = CenteredCustomLabel()
    
    private let greaterThanButton = MyNumberIsButton()
    private let equalToButton = MyNumberIsButton()
    private let lessThanButton = MyNumberIsButton()
    
    private var greateButtonAction: ButtonAction?
    private var equalToButtonAction: ButtonAction?
    private var lessButtonAction: ButtonAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews), name: UIDevice.orientationDidChangeNotification, object: nil)
        addButtonTargets()
        setUpLabelsText()
        layoutAllViews()
        setUpButtonsText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButtonsText() {
        greaterThanButton.setTitle(">", for: .normal)
        equalToButton.setTitle("=", for: .normal)
        lessThanButton.setTitle("<", for: .normal)
    }
    
    private func setUpLabelsText() {
        tryNumberLabel.text = NSLocalizedString("number_of_comuter_tries", comment: "")
        computerIsGuessingNumber.text = NSLocalizedString("computer_is_guessing", comment: "")
        yourNumIs.text = NSLocalizedString("your_number_is", comment: "")
        myNumberIs.text = NSLocalizedString("my_number_is", comment: "")
    }
    
    @objc private func updateViews() {
        tryNumberLabel.removeFromSuperview()
        computerIsGuessingNumber.removeFromSuperview()
        yourNumIs.removeFromSuperview()
        layoutAllViews()
    }

}

// MARK: -- layout
extension ComputerGuessingView {
    private func layoutAllViews() {
//      labels
        tryNumberLabelConstraints()
        computerIsGuessingNumberConstraints()
        yourNumIsConstraints()
        setUpEuqalButton()
        myNumberIsConstraints()
        setUpGreaterThanButton()
        setUpLessThanButton()
    }
    
//  MARK: -- Labels
    
    private func tryNumberLabelConstraints() {
        addToSuper(view: tryNumberLabel)
        setLeftRightConstraintsForLabel(label: tryNumberLabel)
        if UIDevice.current.orientation.isPortrait {
            tryNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        } else {
            tryNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        }
    }
    
    private func computerIsGuessingNumberConstraints() {
        addToSuper(view: computerIsGuessingNumber)
        setLeftRightConstraintsForLabel(label: computerIsGuessingNumber)
        computerIsGuessingNumber.topAnchor.constraint(equalTo: tryNumberLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func yourNumIsConstraints() {
        addToSuper(view: yourNumIs)
        setLeftRightConstraintsForLabel(label: yourNumIs)
        yourNumIs.topAnchor.constraint(equalTo: computerIsGuessingNumber.bottomAnchor, constant: 20).isActive = true
    }
    
    private func myNumberIsConstraints() {
        addToSuper(view: myNumberIs)
        setLeftRightConstraintsForLabel(label: myNumberIs)
        myNumberIs.bottomAnchor.constraint(equalTo: equalToButton.topAnchor, constant: -20).isActive = true
    }
    
    private func setLeftRightConstraintsForLabel(label: UILabel) {
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
    }
    
//   MARK: -- Buttons
    
    private func setUpEuqalButton() {
        addToSuper(view: equalToButton)
        setUpHeightAndWidthAndBottomButtons(button: equalToButton)
        equalToButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setUpGreaterThanButton() {
        addToSuper(view: greaterThanButton)
        setUpHeightAndWidthAndBottomButtons(button: greaterThanButton)
        greaterThanButton.rightAnchor.constraint(equalTo: equalToButton.leftAnchor, constant: -10).isActive = true
    }
    
    private func setUpLessThanButton() {
        addToSuper(view: lessThanButton)
        setUpHeightAndWidthAndBottomButtons(button: lessThanButton)
        lessThanButton.leftAnchor.constraint(equalTo: equalToButton.rightAnchor, constant: 10).isActive = true
    }
    
    private func setUpHeightAndWidthAndBottomButtons(button: UIButton) {
        let isWidthGreaterThanHeight = UIScreen.main.bounds.width > UIScreen.main.bounds.height
        let proportionOfScreen = isWidthGreaterThanHeight ?
        UIScreen.main.bounds.height * 0.25 : UIScreen.main.bounds.width * 0.25
        button.heightAnchor.constraint(equalToConstant: proportionOfScreen).isActive = true
        button.widthAnchor.constraint(equalToConstant: proportionOfScreen).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
    }
    
    private func addToSuper(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Internal methods

extension ComputerGuessingView: ComputerGuessingViewProtocol {
    func setGreaterButton(action: @escaping () -> ()) {
        greateButtonAction = action
    }
    
    func setEqualButton(action: @escaping () -> ()) {
        equalToButtonAction = action
    }
    
    func setLessButton(action: @escaping () -> ()) {
        lessButtonAction = action
    }
    
    func setNumberOfComputerTries(num: Int8) {
        tryNumberLabel.text = NSLocalizedString("number_of_comuter_tries", comment: "") + "\(num)"
    }
    
    func setYourNumIsTitle(num: Int8) {
        yourNumIs.text = NSLocalizedString("your_number_is", comment: "") + "\(num) ?"
    }

//  private methods to work inside internal ones
    private func addButtonTargets() {
        greaterThanButton.addTarget(self, action: #selector(performGreaterAction), for: .touchUpInside)
        equalToButton.addTarget(self, action: #selector(performEqualAction), for: .touchUpInside)
        lessThanButton.addTarget(self, action: #selector(performLessAction), for: .touchUpInside)
    }
    
    @objc private func performGreaterAction() {
        greateButtonAction?()
    }
    
    @objc private func performEqualAction() {
        equalToButtonAction?()
    }
    
    @objc private func performLessAction() {
        lessButtonAction?()
    }
}
