//
//  SettingsController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/29/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UITableViewController, UINavigationBarDelegate {
    
    @IBOutlet weak var verisonNumberLabel: UILabel!
    @IBOutlet weak var iOSVersionLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var sensitiveContentLabel: UILabel!
    @IBOutlet weak var yourAccountLabel: UILabel!
    @IBOutlet weak var changeProfileLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var iOSVersionTitleLabel: UILabel!
    @IBOutlet weak var bugReportLabel: UILabel!
    
    var labels = [[UILabel()]]
    
    var version: String = "0.0.0"
    var build: String = "0"
    
    let cellId = "CellId"
    let supportSection: Int = 6
    let versionPath = IndexPath(row: 0, section: 2)
    let syestemVersionPath = IndexPath(item: 1, section: 2)
    let fileBugPath = IndexPath(row: 2, section: 2)
    let changeProfilePath = IndexPath(row: 1, section: 1)
    let yourAccountPath = IndexPath(row: 0, section: 1)
    
    // App Version
    var appVersion: String {
        return "\(self.version)(\(self.build))"
    }
    
    // iOS Version of Users Device
    var systemVersion: String {
        return "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Settings"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signoutTapped))
        
        guard
            let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String,
            let build = Bundle.main.infoDictionary!["CFBundleVersion"] as? String
            else {
                return
        }
        self.version = version
        self.build = build
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - willDisplay cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath {
        case self.versionPath:
            self.verisonNumberLabel.text = appVersion
        case self.syestemVersionPath:
            self.iOSVersionLabel.text = systemVersion
        default:
            ()
        }
    }
}
