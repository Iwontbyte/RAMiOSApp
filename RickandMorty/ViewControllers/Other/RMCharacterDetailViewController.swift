//
//  RMCharacterDetailViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    private let characterDetialView = RMCharacterDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = characterDetialView.viewModel?.title
        let button1 = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.forward"), style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.rightBarButtonItem  = button1
        
    }
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        super.init(nibName: nil, bundle: nil)
        characterDetialView.viewModel = viewModel
        setupView()
    }
    
    //    arrowshape.turn.up.right.fill
    required init?(coder: NSCoder) {
        fatalError("Unsupported.")
    }
    
    private func setupView() {
        self.view.addSubview(characterDetialView)
        NSLayoutConstraint.activate([
            characterDetialView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterDetialView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterDetialView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterDetialView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func action() {
        print("share button")
    }
}
