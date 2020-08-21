//
//  MankaBaseCollectionReusableView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/22.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import Reusable

class MankaBaseCollectionReusableView: UICollectionReusableView, Reusable{

   override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupLayout() {}

}
