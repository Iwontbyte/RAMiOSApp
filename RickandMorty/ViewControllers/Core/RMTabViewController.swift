//
//  ViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        configTabs()
    }

    private func configTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC  = RMLocationViewController()
        let episodeVC   = RMEpisodeViewController()
        let settingVC   = RMSettingViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode  = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode   = .automatic
        settingVC.navigationItem.largeTitleDisplayMode   = .automatic
        
        let navCharacterVC = UINavigationController(rootViewController: characterVC)
        let navLocationVC  = UINavigationController(rootViewController: locationVC)
        let navEpisodeVC   = UINavigationController(rootViewController: episodeVC)
        let navSettingVC   = UINavigationController(rootViewController: settingVC)
        
        navCharacterVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navLocationVC.tabBarItem  = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe.asia.australia"), tag: 2)
        navEpisodeVC.tabBarItem   = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navSettingVC.tabBarItem   = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 4)
        
        
        for item in [navCharacterVC,navLocationVC,navEpisodeVC,navSettingVC] {
            item.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([navCharacterVC,navLocationVC,navEpisodeVC,navSettingVC], animated: true)
    }
}

