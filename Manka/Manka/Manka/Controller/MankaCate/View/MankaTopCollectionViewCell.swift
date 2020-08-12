//
//  MankaTopCollectionViewCell.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/12.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaTopCollectionViewCell: MankaBaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        return iw
    }()
    
    override func setupLayout() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.masksToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    
    var model: MankaTopModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(with: URL(string: model.cover ?? ""))
        }
    }
}
