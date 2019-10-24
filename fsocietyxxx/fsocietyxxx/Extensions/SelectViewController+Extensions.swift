//
//  SelectViewController+Extensions.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/24/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

extension SelectViewController {

    /// Sets up the collection view before its displayed.
    func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.systemBackground
        view.backgroundColor = UIColor.systemBackground
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(OptionCell.self, forCellWithReuseIdentifier: optionCellID)
    }
    
    // MARK: - willDisplay
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? OptionCell else {
            return
        }
        DispatchQueue.main.async {
            cell.layer.cornerRadius = 15
            cell.clipsToBounds = true
            cell.backgroundColor = UIColor.secondarySystemBackground
        }
    }
    
    // MARK: - numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let optionCell = collectionView.dequeueReusableCell(withReuseIdentifier: optionCellID, for: indexPath) as? OptionCell else {
            print("text cell could not be dequeued")
            return OptionCell()
        }
        optionCell.details = details[indexPath.row]
        return optionCell
    }
    
    // MARK: - sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 16 - 16, height: 85)
    }
    
    // MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = details[indexPath.row]
        
       switch item.detailName {
        case "Create new...":
            print("Create new tapped")
        case "View short term goals":
            let tableController = MainTableViewController()
            tableController.tableViewTitle = "Short term goals"
            let navigationController = UINavigationController(rootViewController: tableController)
            show(navigationController, sender: self)
        case "View long term goals":
            let tableController = MainTableViewController()
            tableController.tableViewTitle = "Long term goals"
            let navigationController = UINavigationController(rootViewController: tableController)
            show(navigationController, sender: self)
        default:
            ()
        }
    }
    
    // MARK: - minimumLineSpacingForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }

    func openUrl(urlStr: String) {
        
        func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
            return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
        }
        
        if let url = NSURL(string: urlStr) {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        }
    }
}
