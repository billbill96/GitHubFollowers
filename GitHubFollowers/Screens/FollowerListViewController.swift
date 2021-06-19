//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 13/6/2564 BE.
//

import UIKit

class FollowerListViewController: UIViewController {

    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureViewController()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("followers count \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happed.",
                                                message: error.rawValue,
                                                buttonTitle: "OK")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCollectionViewCell.self,
                                forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
}

//extension FollowerListViewController
