//
//  SelectViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class SelectViewController: UIViewController, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UINavigationBarDelegate {
 
    let optionCellID = "OptionID"
    let listCellID = "ListID"
    
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
        details.append(CellDetails(detailName: "Next KeepDate", detailDate: "October 31st: Anniversary", cellType: .upcomingKeepDate))
        details.append(CellDetails(detailName: "Upcoming KeepDate", detailDate: "December 25th: Christmas", cellType: .upcomingKeepDate))
        details.append(CellDetails(detailName: "View your existing KeepDates", cellType: .title))
        details.append(CellDetails(detailName: "View your Saving List", cellType: .title))
    }
}
