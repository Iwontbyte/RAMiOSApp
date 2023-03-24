//
//  RMCharacterDetailView.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import UIKit

class RMCharacterDetailView: UIView {
    
    public weak var delegate: RMCharacterListViewDelegate?
    
    public var viewModel: RMCharacterDetailViewViewModel?
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
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
        tableView.allowsSelection = false
    }
    
}


extension RMCharacterDetailView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1{
            if let character = viewModel?.character {
                let characterInfoViewModel = RMCharacterInfoTableViewCellViewModel(character:character)
                return characterInfoViewModel.cellInfo.count
            }
            return 0
        } else if section == 2 {
            return 1
        } else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.frame.height * 0.55
        } else if indexPath.section == 1 {
            return  90
        } else {
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterPhotoViewModel = RMCharacterPhotoTableViewCellViewModel(imageUrl: URL(string: viewModel?.image ?? ""))
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterPhotoTableViewCell.identifier, for: indexPath) as? RMCharacterPhotoTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: characterPhotoViewModel)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterInfoTableViewCell.identifier, for: indexPath) as? RMCharacterInfoTableViewCell else {
                return UITableViewCell()
            }
            if let character = viewModel?.character {
                let characterInfoViewModel = RMCharacterInfoTableViewCellViewModel(character:character)
                cell.configure(with: characterInfoViewModel.cellInfo[indexPath.row])
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterEpisodeTableViewCell.identifier, for: indexPath) as? RMCharacterEpisodeTableViewCell else {
                return UITableViewCell()
            }
            if let character = viewModel?.character {
                let characterEpisodeViewModel = RMCharacterEpisodeTableViewCellViewModel(character:character)
                cell.configure(with: characterEpisodeViewModel.episode)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
