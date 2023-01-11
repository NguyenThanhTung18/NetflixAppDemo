//
//  MainTabBarViewController.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 29/12/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func config() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upCommingVC = UINavigationController(rootViewController: UpCommingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadVC = UINavigationController(rootViewController: DownloadViewController())
         
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upCommingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadVC.tabBarItem.image = UIImage(systemName: "arrow.down.square")
        
        homeVC.title = "Home"
        upCommingVC.title = "Coming soon"
        searchVC.title = "Search"
        downloadVC.title = "Download"
        
        setViewControllers([homeVC,upCommingVC,searchVC,downloadVC], animated: true)
    }

}
