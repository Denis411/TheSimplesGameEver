//
//  ViewController.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {
    let button = CustomBlueButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        button.setUpBottomConstraints(for: self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.layoutSubviews()
    }
}

