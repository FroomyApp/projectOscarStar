//
//  MainTableViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewController: UITableViewController, UINavigationBarDelegate {
    
    var tableViewTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = tableViewTitle
        
    }
    
}
