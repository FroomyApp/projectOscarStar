//
//  ViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/22/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fsocietyxxxLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to fsocietyxxx"
        label.textColor = .green
        label.font = UIFont(name: "Menlo", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "fsociety email"
        textField.backgroundColor = .darkGray
        textField.textColor = .green
        textField.font = UIFont(name: "Menlo", size: 18)
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "fsociety password"
        textField.backgroundColor = .darkGray
        textField.textColor = .green
        textField.font = UIFont(name: "Menlo", size: 18)
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = UIFont(name: "Menlo", size: 20)
        button.addTarget(self, action: #selector(continueButtonEnabled), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupObkectConstraints()
    }
    
    func setupObkectConstraints() {
        view.addSubview(fsocietyxxxLabel)
        fsocietyxxxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fsocietyxxxLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 185).isActive = true
        fsocietyxxxLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        fsocietyxxxLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        fsocietyxxxLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: fsocietyxxxLabel.bottomAnchor, constant: 15).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        view.addSubview(continueButton)
        continueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
    }

}

extension ViewController {
    
    @objc func continueButtonEnabled() {
        let tableController = MainTableViewController()
        let navigationController = UINavigationController(rootViewController: tableController)
        show(navigationController, sender: self)
    }
    
}
