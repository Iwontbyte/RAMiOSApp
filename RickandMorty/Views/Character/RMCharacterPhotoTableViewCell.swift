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
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            detailImageView.leftAnchor.constraint(equalTo: leftAnchor),
            detailImageView.rightAnchor.constraint(equalTo: rightAnchor),
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
