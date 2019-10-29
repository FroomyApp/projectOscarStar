//
//  TabBarController.swift
//  fsocietyxxx
//
//  Created by Tyler P Admin on 10/29/19.
//  Copyright © 2019 Froomy. All rights reserved.
//

import Foundation
import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let mainUI = UINavigationController(rootViewController: SelectViewController())
        mainUI.tabBarItem = UITabBarItem(title: "MainUI", image: UIImage(named: ""), tag: 0)

        let keepDateContoller = ExistingKeepDatesTableViewController()
        let existingKeepDates = UINavigationController(rootViewController: keepDateContoller)
        existingKeepDates.tabBarItem = UITabBarItem(title: "KeepDates", image: UIImage(named: ""), tag: 1)
        
        let savingController = UINavigationController(rootViewController: SavingListController())
        savingController.tabBarItem = UITabBarItem(title: "SavingList", image: UIImage(named: ""), tag: 2)
        
        let relationshipProfile = UINavigationController(rootViewController: SignificantOtherProfileController())
        relationshipProfile.tabBarItem = UITabBarItem(title: "Dating Profile", image: UIImage(named: ""), tag: 3)
//        relationshipProfile.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)

        let storyBoard: UIStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "GroupedTableView") as? SettingsController
        let settingsNavController = UINavigationController(rootViewController: settingsViewController!)
        settingsNavController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: ""), tag: 4)
        
        let viewControllerList = [mainUI, existingKeepDates, savingController, relationshipProfile, settingsNavController]
        viewControllers = viewControllerList
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    //Delegate that handles transition animation between views in TabBarController
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningObject()
    }
}

//Class that declares the animation for TabBarController
class TransitioningObject: NSObject, UIViewControllerAnimatedTransitioning {

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView: UIView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView: UIView = transitionContext.view(forKey: UITransitionContextViewKey.to)!

        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)

        UIView.transition(from: fromView, to: toView, duration: transitionDuration(using: transitionContext), options: UIView.AnimationOptions.transitionCrossDissolve) { _ in
            transitionContext.completeTransition(true)
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}

extension UITabBarController {
    func increaseBadge(indexOfTab: Int, num: String) {
        let tabItem = tabBar.items?[indexOfTab]
        tabItem?.badgeValue = num
    }

    func retrieveBadgeNumber( indexOfTab: Int) -> Int? {
        return Int(tabBar.items?[indexOfTab].badgeValue ?? "0")
    }
}
