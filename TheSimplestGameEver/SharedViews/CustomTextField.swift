//
//  CustomTextField.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("I don't use storyboards in the project")
    }
    
    private func setUpAppearance() {
        let text = NSLocalizedString("think_of_a_number", comment: "")
        self.placeholder = text
        self.textAlignment = .center
        self.font = UIFont(name: "GillSans-Light", size: 18)
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }

}
