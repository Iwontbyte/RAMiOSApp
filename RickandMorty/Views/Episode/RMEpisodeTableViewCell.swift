//
//  RMEpisodeTableViewCell.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/24.
//

import UIKit

class RMEpisodeTableViewCell: UITableViewCell {

    static let identifier = "RMEpisodeTableViewCell"
    
    private let viewModel = RMEpisodeTableViewCellViewModel()
    
    private let borderColors: [UIColor] = [
        .systemGreen,
        .systemBlue,
        .systemOrange,
        .systemPink,
        .systemPurple,
        .systemRed,
        .systemYellow,
        .systemIndigo,
        .systemMint
    ]
    
    private let cardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .tertiarySystemBackground
        return cardView
    }()
    
    private var episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var episodeName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var aironLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func addConstraints() {
        contentView.addSubview(cardView)
        cardView.addSubview(episodeLabel)
        cardView.addSubview(episodeName)
        cardView.addSubview(aironLabel)
        NSLayoutConstraint.activate([
            
            cardView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.9),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
         
            episodeLabel.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 5),
            episodeLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor,constant: 10),
            
            episodeName.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor,constant: 5),
            episodeName.leftAnchor.constraint(equalTo: cardView.leftAnchor,constant: 10),
            episodeName.rightAnchor.constraint(equalTo: cardView.rightAnchor,constant: -10),
            
            aironLabel.topAnchor.constraint(equalTo: episodeName.bottomAnchor,constant: 5),
            aironLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor,constant: 10),
            aironLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -7),
            
        ])
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeLabel.text = nil
        episodeName.text = nil
        aironLabel.text = nil
    }
    
    
    func configure(episodeLabel: String, episodeName: String, aironLabel:String ) {
        let radomNum = Int.random(in: 0..<borderColors.count)
        self.episodeLabel.text = episodeLabel
        self.episodeName.text = episodeName
        self.aironLabel.text = aironLabel
        cardView.layer.cornerRadius = 8
        cardView.layer.borderWidth = 1.5
        cardView.layer.borderColor = borderColors[radomNum].cgColor
    }

}
