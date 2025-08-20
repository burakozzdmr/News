//
//  TabBarController.swift
//  News
//
//  Created by Burak Özdemir on 20.08.2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
}

// MARK: - Publics

extension TabBarController {
    func setupTabBar() {
        let homeController = createNavController(
            with: "Home",
            and: .init(systemName: "newspaper.fill") ?? .init(),
            for: NewsListViewController()
        )
        
        let settingsController = createNavController(
            with: "Settings",
            and: .init(systemName: "gearshape.fill") ?? .init(),
            for: SettingsViewController()
        )
        
        self.setViewControllers([homeController, settingsController], animated: false)
    }
    
    func createNavController(
        with title: String,
        and image: UIImage,
        for viewController: UIViewController
    ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.largeTitleDisplayMode = .always
        viewController.title = title
        return navController
    }
}
