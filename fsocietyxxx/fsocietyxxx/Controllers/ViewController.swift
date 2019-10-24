//
//  ViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
     }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont(name: "Menlo", size: 24)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(enableContinue), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        setupObjectConstraints()
        
    }

    func setupObjectConstraints() {
        view.addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func enableContinue() {
        let navigationController = UINavigationController(rootViewController: SelectViewController())
        navigationController.modalPresentationStyle = .fullScreen
        show(navigationController, sender: self)

    }
    
}

