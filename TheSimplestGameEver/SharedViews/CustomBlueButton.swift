//
//  CustomBlueButton.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class CustomBlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("I don't use storyboards in this project.")
    }
    
    private func setUpAppearance() {
        self.layer.backgroundColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 15
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
    }
    
    func setUpBottomConstraints(for controller: UIViewController) {
        controller.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 25).isActive = true
        self.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -25).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -25).isActive = true
    }
}

extension CustomBlueButton {
    func blockButton(_ isBlocked: Bool) {
        if isBlocked {
            self.isUserInteractionEnabled = false
            self.layer.backgroundColor = UIColor.gray.cgColor
        } else {
            self.isUserInteractionEnabled = true
            self.layer.backgroundColor = UIColor.blue.cgColor
        }
    }
}
