//
//  RMCharacterViewController.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import UIKit

final class RMCharacterViewController: UIViewController {
   
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "Character"
        let button1 = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchCharacter))
        self.navigationItem.rightBarButtonItem  = button1
        setupView()
       
    }
    
    private func setupView() {
        characterListView.delegate = self
        self.view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func searchCharacter() {
        let searchCharacterViewController = RMCharacterSearchViewController()
        navigationController?.pushViewController(searchCharacterViewController, animated: true)
    }

}

extension RMCharacterViewController: RMCharacterListViewDelegate {
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        let detialViewModel = RMCharacterDetailViewViewModel(character: character)
        let detialViewController = RMCharacterDetailViewController(viewModel: detialViewModel)
        navigationController?.pushViewController(detialViewController, animated: true)
    }
}
