//
//  MankaRankCollectionViewCell.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/12.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaRankCollectionViewCell: MankaBaseCollectionViewCell {
    
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        return iw
    }()
    
    private lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .center
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = .black
        return tl
    }()
    
    override func setupLayout(){
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.masksToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview()
            make.height.equalTo(contentView.snp.width).multipliedBy(0.75)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(iconView.snp.bottom)
        }
    }
    
    var model: MankaRankingModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(with: URL(string: model.cover ?? ""))
            titleLabel.text = model.sortName
        }
    }
}
