//
//  SlidingCells.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class SlidingCells: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Gray view that will be replaced with content.
    let greyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBackground
        view.layer.cornerRadius = 16
        return view
    }()
    
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(greyView)
        greyView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    }
    
}

