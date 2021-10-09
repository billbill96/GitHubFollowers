//
//  GFTabBarController.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 9/10/2564 BE.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(),
                           createFavoriteNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchViewController)
    }
    
    func createFavoriteNavigationController() -> UINavigationController {
        let favoriteListViewController = FavoriteListViewController()
        favoriteListViewController.title = "Favorite"
        favoriteListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoriteListViewController)
    }
}
