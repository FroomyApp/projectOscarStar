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
    let listCellID = "ListID"
    
    var padding: CGFloat = 16
    
    var details: [CellDetails] = [CellDetails]()
    
    var collectionView: UICollectionView!
    
    var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        setupCollectionView()
        setNavigationBarProperties()
        createInterestsArray()
        
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func setNavigationBarProperties() {
        navigationItem.title = "KeepDate"
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func doneTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addTapped() {
        
    }
        
    public func createInterestsArray() {
        details.append(CellDetails(detailName: "Next KeepDate", cellType: .big))
        details.append(CellDetails(detailName: "View your existing KeepDates", cellType: .small))
        details.append(CellDetails(detailName: "View your Saving List", cellType: .small))
    }
    
    //Add "Upcoming Dates" to big cell, with the sliding cell being stores.
}
