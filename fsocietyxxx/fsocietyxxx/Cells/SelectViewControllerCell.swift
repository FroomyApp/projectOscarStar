//
//  SelectViewControllerCell.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class OptionCell: UICollectionViewCell {
    
    let padding: CGFloat = 16
    
    var details: CellDetails? {
        didSet {
            optionTitleLabel.text = details?.detailName
        }
    }
    
    /// Text view that displays the name of the details being shown in the cell.
    var optionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///Defines the width of the entire cell.
    var widthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        
        addSubview(optionTitleLabel)
        optionTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        optionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}

class ListCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let slidingCellID = "slidingCellID"
        
    var details: CellDetails? {
        didSet {
            listTitleLabel.text = details?.detailName
            ideasTitleLabel.text = "Here's some ideas:"
            upcomingKeepDateLabel.text = details?.detailDate
        }
    }
    
    /// Text view that displays the name of the details being shown in the cell.
    var listTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ideasTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var upcomingKeepDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //CollectionView that stores the StoreContent Cell
    var bigCellCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    private func sharedInit() {
        backgroundColor = .clear
           
        addSubview(listTitleLabel)
        addSubview(bigCellCollectionView)
        addSubview(upcomingKeepDateLabel)
        addSubview(ideasTitleLabel)
       
        bigCellCollectionView.delegate = self
        bigCellCollectionView.dataSource = self
       
        bigCellCollectionView.register(SlidingCells.self, forCellWithReuseIdentifier: slidingCellID)
       
        //bigCellCollectionView left constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": bigCellCollectionView]))
       
        //left and right constraints
        // -14-[v0] means 14 px from left of View
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": listTitleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": upcomingKeepDateLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": ideasTitleLabel]))
       
        //All views vertical constraints
        //Reads from left to right, listTitleLabel is above upcomingKeepDateLabel, upcomingKeepDateLabel is above ideasTitleLabel, ideasTitleLabel is above bigCellCollectionView
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[sectionTitleLabel(30)]-10-[v1]-30-[v2][v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil,
                                                     views: ["v0": bigCellCollectionView, "v1": upcomingKeepDateLabel, "v2": ideasTitleLabel, "sectionTitleLabel": listTitleLabel]))
    }

    //Returns 7 *notes*
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: slidingCellID, for: indexPath) as? SlidingCells else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    //Returns 14px from left, and 14px from right for SlidingCells(right takes place after a scroll to the right)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }

}
