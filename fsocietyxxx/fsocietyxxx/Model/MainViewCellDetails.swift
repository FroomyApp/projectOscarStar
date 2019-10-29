//
//  MainViewCellDetails.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/29/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

struct CellDetails {
    
    var detailName: String?
    
    var detailDate: String?
        
    var cellType: CellType
}

enum CellType: String, Codable {
    
    /// Smaller Cell
    case title
    
    /// Big Cell with a lot of content
    case upcomingKeepDate
    
    /// Returns the the CellType in String form.
    var name: String {
        return rawValue
    }
    
}
