//
//  SelectViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class SelectViewController: UIViewController, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UINavigationBarDelegate {
 
    let optionCellID = "OptionID"
    
    var padding: CGFloat = 16
    
    var details: [CellDetails] = [CellDetails]()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        setupCollectionView()
        setNavigationBarProperties()
        createInterestsArray()
        
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
    }
    
    func setNavigationBarProperties() {
        navigationItem.title = "Welcome!"
        let leftBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func doneTapped() {
        self.dismiss(animated: true, completion: nil)
    }
        
    public func createInterestsArray() {
        details.append(CellDetails(detailName: "Create new...", detailMessage: "Create a new to-do item..."))
        details.append(CellDetails(detailName: "View short term goals", detailMessage: "Your short to-do items"))
        details.append(CellDetails(detailName: "View long term goals", detailMessage: "Your long term to-do items"))
    }
    
}
