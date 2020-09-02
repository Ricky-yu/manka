//
//  MankaOtherWorksTCell.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/16.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaOtherWorksTCell: MankaBaseTableViewCell {
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: MankaDetailStaticModel? {
        didSet{
            guard let model = model else { return }
            textLabel?.text = "其他作品"
            detailTextLabel?.text = "\(model.otherWorks?.count ?? 0)本"
            detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
}
