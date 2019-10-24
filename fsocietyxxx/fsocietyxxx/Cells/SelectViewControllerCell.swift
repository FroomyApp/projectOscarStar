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

class ListCell: UICollectionViewCell {
    
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
        
        addSubview(listTitleLabel)
        listTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        listTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}

