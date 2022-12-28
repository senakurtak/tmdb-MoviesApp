//
//  TabBarController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 9.12.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tabBar.backgroundColor = UIColor(red: (2/255), green: (41/255), blue: (71/255), alpha: (0.0))
        
        let firstVC = ContentViewController()
        let secondVC = SavedViewController()
        
        self.setViewControllers([firstVC,secondVC], animated: true)
        firstVC.title = "Home"
        firstVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        secondVC.title = "Favorites"
        
        secondVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 0)
        
        self.tabBar.barTintColor = UIColor(red: (13/255), green: (37/255), blue: (63/255), alpha: 0.0)
    }
}
