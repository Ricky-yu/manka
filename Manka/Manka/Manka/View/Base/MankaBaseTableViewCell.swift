//
//  MankaBaseTableViewCell.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/15.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import Reusable

class MankaBaseTableViewCell: UITableViewCell ,Reusable{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupUI() {}
    
}

