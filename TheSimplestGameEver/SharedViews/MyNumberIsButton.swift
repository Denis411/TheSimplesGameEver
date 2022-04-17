//
//  MyNumberIsButton.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class MyNumberIsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeButton() {
        self.layer.backgroundColor = UIColor.yellow.cgColor
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 10
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.titleLabel?.font = UIFont(name: "Thonburi-Bold", size: 22)
    }
}
