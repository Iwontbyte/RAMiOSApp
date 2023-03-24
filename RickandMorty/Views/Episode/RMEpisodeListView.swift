//
//  RMEpisodeListView.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/24.
//

import UIKit

class RMEpisodeListView: UIView {

    let viewModel = RMEpisodeListViewViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(RMEpisodeTableViewCell.self, forCellReuseIdentifier: RMEpisodeTableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
        setupTableView()
        viewModel.getAllEpisode()
    }

    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private func setupTableView() {
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        
    }
    
    private func addConstraints() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
