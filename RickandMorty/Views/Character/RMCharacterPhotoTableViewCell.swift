//
//  RMCharacterPhotoTableViewCell.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/21.
//

import UIKit

class RMCharacterPhotoTableViewCell: UITableViewCell {
    
    static let identifier = "RMCharacterPhotoTableViewCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
