//
//  CenteredCustomLabel.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class CenteredCustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("I don't use storyboards in the project")
    }
    
    private func setUpAppearance() {
        self.backgroundColor = .clear
        self.textColor = .blue
        self.textAlignment = .center
        self.font = UIFont(name: "GillSans-BoldItalic", size: 20)
        self.numberOfLines = 1
        self.lineBreakMode = .byTruncatingTail
    }
}
