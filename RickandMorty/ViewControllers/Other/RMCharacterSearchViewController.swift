//
//  RMCharacterSearchViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/24.
//

import UIKit

class RMCharacterSearchViewController: UIViewController {
    
    private let searchView = RMSearchCharacterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported.")
    }
    

    private func setupViews() {
        self.view.addSubview(searchView)
        searchView.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }

}
