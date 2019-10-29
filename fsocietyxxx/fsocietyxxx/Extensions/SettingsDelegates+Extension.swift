//
//  SettingsDelegates+Extension.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/29/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

extension SettingsController {
    
    
    /// Shows Alert View to send user to Bug Reporting Form on Google Sheets
    func showBugReportVersionNumber() {
//        let bugReportAction = UIAlertAction(title: "Take me there!", style: .default) { [weak self] (_) in
//            guard let self = self else { return }
//            self.openUrl(urlStr: "https://bit.ly/2OroMLs")
//            // deselect the selected row if any
//            let selectedRow: IndexPath? = self.tableView.indexPathForSelectedRow
//            if let selectedRowNotNill = selectedRow {
//                self.tableView.deselectRow(at: selectedRowNotNill, animated: true)
//            }
//        }
//        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] (_) in
//            guard let self = self else { return }
//            // deselect the selected row if any
//            let selectedRow: IndexPath? = self.tableView.indexPathForSelectedRow
//            if let selectedRowNotNill = selectedRow {
//                self.tableView.deselectRow(at: selectedRowNotNill, animated: true)
//            }
//        }
//        Alert.alertWithActions(on: self, withTitle: appVersion, message: "You'll need your app version number for this form, so please remember this.",
//                               withStyle: .alert, andActions: [bugReportAction, dismissAction])
    }
    
    /**
     Turns a String into a URL and opens the link in a Safari window
     - Parameter urlStr: the url passed in to be opened in a safari window.
     */
    func openUrl(urlStr: String) {
        if let url = NSURL(string: urlStr) {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        }
    }
    
    //Sign Out Button
    @objc func signoutTapped(_ sender: UIButton) {
    
    }
    
}

/**
 Helper function inserted by Swift 4.2 migrator.
 - Parameter input: [String: Any]
 **/
private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
