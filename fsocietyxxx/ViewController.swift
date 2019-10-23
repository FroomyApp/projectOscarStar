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
        label.font = UIFont(name: "Menlo", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        fsocietyxxxLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        fsocietyxxxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(continueButton)
        continueButton.topAnchor.constraint(equalTo: fsocietyxxxLabel.bottomAnchor, constant: 10).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension ViewController {
    
    @objc func continueButtonEnabled() {
        let tableController = MainTableViewController()
        let navigationController = UINavigationController(rootViewController: tableController)
        show(navigationController, sender: self)
    }
    
}
