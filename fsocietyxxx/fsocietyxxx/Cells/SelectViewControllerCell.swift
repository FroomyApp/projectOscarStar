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

