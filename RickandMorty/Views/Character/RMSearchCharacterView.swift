//
//  RMSearchCharacterView.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/24.
//

import UIKit

class RMSearchCharacterView: UIView {

    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        addConstraints()
    
    }

    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
