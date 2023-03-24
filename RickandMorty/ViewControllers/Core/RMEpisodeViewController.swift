//
//  RMEpisodeViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMEpisodeViewController: UIViewController {

    private let EpisodeListView = RMEpisodeListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Episode"
        setupView()
    
    }
    
    private func setupView() {
        self.view.addSubview(EpisodeListView)
        NSLayoutConstraint.activate([
            EpisodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            EpisodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            EpisodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            EpisodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

   

}
