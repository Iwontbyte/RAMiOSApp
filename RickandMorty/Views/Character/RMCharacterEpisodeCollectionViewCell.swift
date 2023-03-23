//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/23.
//

import UIKit

class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RMCharacterEpisodeCollectionViewCell"
    
    private let viewModel = RMCharacterEpisodeCollectionViewCellViewModel()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubview(episodeLabel)
        contentView.addSubview(episodeName)
        contentView.addSubview(aironLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported.")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            episodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            episodeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            episodeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            
            episodeName.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor,constant: 8),
            episodeName.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            episodeName.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            
            aironLabel.topAnchor.constraint(equalTo: episodeName.bottomAnchor,constant: 8),
            aironLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            aironLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5),
            aironLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            
        ])
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeLabel.text = nil
        episodeName.text = nil
        aironLabel.text = nil
    }
    
    
    func configure(with url: String ) {
        guard let url = URL(string: url) else {
            return
        }
        RMService.shared.execute(url, expecting: RMEpisode.self, completion: {[weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.episodeLabel.text = "Episode: " + response.episode
                    self?.episodeName.text = response.name
                    self?.aironLabel.text = "Aired on: " + response.air_date
                }
                break
            case .failure(let error):
                print(String(describing: error))
            }
        })
    }
}
