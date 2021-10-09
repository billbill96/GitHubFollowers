//
//  FavoriteListViewController.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 12/6/2564 BE.
//

import UIKit

class FavoriteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}
