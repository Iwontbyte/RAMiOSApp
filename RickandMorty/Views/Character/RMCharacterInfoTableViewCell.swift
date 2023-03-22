//
//  RMCharacterInfoTableViewCell.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/21.
//

import UIKit

class RMCharacterInfoTableViewCell: UITableViewCell {
    
    static let identifier = "RMCharacterInfoTableViewCell"
    
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let value: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 8
        cardView.backgroundColor = .secondarySystemBackground
        return cardView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.addSubview(icon)
        cardView.addSubview(title)
        cardView.addSubview(value)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.9),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            icon.widthAnchor.constraint(equalToConstant: 35),
            icon.heightAnchor.constraint(equalToConstant: 35),
            icon.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 30),
            icon.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            title.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 80),
            title.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            value.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 10),
            value.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            value.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
        ])
    }
    
    func configure(with cellInfo:RMCharacterInfoTableViewCellViewModel.CellInfo ) {
        title.text = cellInfo.title
        title.textColor = cellInfo.color
        value.text = cellInfo.value
        icon.tintColor = cellInfo.color
    }
}
