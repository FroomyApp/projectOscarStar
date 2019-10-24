//
//  SelectViewControllerCell.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

struct CellDetails {
    
    var detailName: String?
    
    var detailMessage: String?
    
    var cellType: CellType
}

enum CellType: String, Codable {
    
    /// Post contains only text.
    case small
    
    /// Post contains only video.
    case big
    
    /// Returns the the post type in String form.
    var name: String {
        return rawValue
    }
    
}

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
    
    let padding: CGFloat = 16
    
    var details: CellDetails? {
        didSet {
            listTitleLabel.text = details?.detailName
        }
    }
    
    /// Text view that displays the name of the details being shown in the cell.
    var listTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //CollectionView that stores the NoteContent Cell(i.e. Notes themselves)
    var bigCellCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    ///Defines the width of the entire cell.
    var widthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
        setupViews()
    }
    
    private func sharedInit() {
        
        addSubview(listTitleLabel)
        listTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        listTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupViews() {
        backgroundColor = .clear

        addSubview(bigCellCollectionView)

        
        bigCellCollectionView.delegate = self
        bigCellCollectionView.dataSource = self
        
        bigCellCollectionView.register(SlidingCells.self, forCellWithReuseIdentifier: slidingCellID)
        
        //NotesCollectionView left constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": bigCellCollectionView]))
        
        //All views vertical constraints
        //Reads from left to right, sectionTitleLabel is above NotesCollectionView, NotesCollectionView is above DividerLineView
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil,
                                                      views: ["v0": bigCellCollectionView]))
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
    
    //NoteContentCell Frame(width/height, - 33 so that way the grayView doesn't get overlapped by the SectionTitleLabel)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height - 33)
    }
    
    //Returns 14px from left, and 14px from right for NoteContentCell(right takes place after a scroll to the right)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }

}

