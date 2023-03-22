//
//  RMCharacterPhotoTableViewCell.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/21.
//

import UIKit

class RMCharacterPhotoTableViewCell: UITableViewCell {
    
    static let identifier = "RMCharacterPhotoTableViewCell"
    
    private let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(detailImageView)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: topAnchor),
            detailImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 15),
            detailImageView.rightAnchor.constraint(equalTo: rightAnchor,constant: -15),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func configure(with viewModel:RMCharacterPhotoTableViewCellViewModel) {
        viewModel.fetchImage(completion: { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.detailImageView.image = image
                }
            case .failure(let failure):
                print(failure)
            }
            
        })
    }
    
}
