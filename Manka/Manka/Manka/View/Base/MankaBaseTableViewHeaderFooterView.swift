//
//  MankaBaseTableViewHeaderFooterView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/23.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import Reusable

class MankaBaseTableViewHeaderFooterView: UITableViewHeaderFooterView, Reusable {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupLayout() {}
    
}
