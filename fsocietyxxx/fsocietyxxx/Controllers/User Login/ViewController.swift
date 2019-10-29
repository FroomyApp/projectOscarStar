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
        textField.backgroundColor = UIColor.secondarySystemBackground
        textField.placeholder = " Your email..."
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.secondarySystemBackground
        textField.placeholder = " Your password..."
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 5
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
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func enableContinue() {
//        let navigationController = UINavigationController(rootViewController: SelectViewController())
        let navigationController = UINavigationController(rootViewController: TabViewController())
        navigationController.modalPresentationStyle = .fullScreen
        show(navigationController, sender: self)

    }
    
}

