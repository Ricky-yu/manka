//
//  MankaReadCollectionViewCell.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/22.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import Kingfisher


extension UIImageView: Placeholder {}

class MankaReadCollectionViewCell: MankaBaseCollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var placeholder: UIImageView = {
        let placeholder = UIImageView(image: UIImage(named: "yaofan"))
        placeholder.contentMode = .center
        return placeholder
    }()
    
    override func setupLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    
    var model: MankaImageModel? {
        didSet {
            guard let model = model else { return }
            imageView.image = nil
            imageView.kf.setImage(with:URL(string: model.location ?? ""), placeholder: placeholder)
        }
    }
}
