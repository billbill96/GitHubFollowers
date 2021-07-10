//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Supannee Mutitanon on 13/6/2564 BE.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    enum Section {
        case main
    }

    var username: String!
    var followers: [Followers] = []
    
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Followers>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureViewController()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                self.followers = followers
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happed.",
                                                message: error.rawValue,
                                                buttonTitle: "OK")
            }
        }
    }
        
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self,
                                forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
        collectionView.alwaysBounceVertical = true
    }
    

    func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Followers>(collectionView: collectionView,
                                                                            cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID,
                                                          for: indexPath) as! FollowerCollectionViewCell
            cell.set(followers: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Followers>()
        snapShot.appendSections([.main]) //add section
        snapShot.appendItems(followers)
        datasource.apply(snapShot, animatingDifferences: true)
    }
}
