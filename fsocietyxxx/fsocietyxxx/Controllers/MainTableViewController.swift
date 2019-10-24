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
    
    /// The search controller for your To-Do's.
    let searchController = UISearchController(searchResultsController: nil)
    
    var tableViewTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = tableViewTitle
        setupSearchController()
        
    }
    
    /// Sets up the search controller.
     func setupSearchController() {
//         searchController.searchResultsUpdater = self
         searchController.obscuresBackgroundDuringPresentation = false
         searchController.searchBar.placeholder = "Search Matches"
         navigationItem.searchController = searchController
         definesPresentationContext = true
     }
    
}
