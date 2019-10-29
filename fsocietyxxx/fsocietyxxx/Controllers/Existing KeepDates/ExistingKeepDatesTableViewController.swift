//
//  MainTableViewController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class ExistingKeepDatesTableViewController: UITableViewController, UINavigationBarDelegate {
    
    /// The search controller for your To-Do's.
    let searchController = UISearchController(searchResultsController: nil)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Existing KeepDates"
        setupSearchController()      
    }
    
    /// Sets up the search controller.
     func setupSearchController() {
//         searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Existing KeepDates..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
     }
    
}
