//
//  RMCharacterDetailView.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import UIKit

class RMCharacterDetailView: UIView {
    
    public weak var delegate: RMCharacterListViewDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //        tableView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.identifier)
        tableView.register(RMCharacterPhotoTableViewCell.self, forCellReuseIdentifier: RMCharacterPhotoTableViewCell.identifier)
        tableView.register(RMCharacterInfoTableViewCell.self, forCellReuseIdentifier: RMCharacterInfoTableViewCell.identifier)
        tableView.register(RMCharacterEpisodeTableViewCell.self, forCellReuseIdentifier: RMCharacterEpisodeTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addConstraint()
        setupTabelView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func setupTabelView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}


extension RMCharacterDetailView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterPhotoTableViewCell.identifier, for: indexPath) as? RMCharacterPhotoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterInfoTableViewCell.identifier, for: indexPath) as? RMCharacterPhotoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterEpisodeTableViewCell.identifier, for: indexPath) as? RMCharacterPhotoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
