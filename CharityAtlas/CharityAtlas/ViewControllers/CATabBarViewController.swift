//
//  ViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 10/17/23.
//

import UIKit

final class CATabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs() {
        let homeVC = CAHomeViewController()
        let charitiesVC = CACharitiesViewController()
        let charityEventsVC = CACharityEventsViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        charitiesVC.navigationItem.largeTitleDisplayMode = .automatic
        charityEventsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let homeTab = UINavigationController(rootViewController: homeVC)
        let charitiesTab = UINavigationController(rootViewController: charitiesVC)
        let charityEventsTab = UINavigationController(rootViewController: charityEventsVC)
        
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        charitiesTab.tabBarItem = UITabBarItem(title: "Charities", image: UIImage(systemName: "cross.case"), tag: 1)
        charityEventsTab.tabBarItem = UITabBarItem(title: "Events", image: UIImage(systemName: "calendar"), tag: 2)
        
        for tab in [homeTab, charitiesTab, charityEventsTab] {
            tab.navigationBar.prefersLargeTitles = true
        }

        setViewControllers(
            [homeTab, charitiesTab, charityEventsTab],
            animated: true
        )
    }
    
}

