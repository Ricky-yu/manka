//
//  MineHeadView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/09/02.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaMineHeadView: UIView {

    
    private lazy var bgView: UIImageView = {
        let bw = UIImageView()
        bw.contentMode = .scaleAspectFill
        bw.image = UIImage(named: "mine_bg_for_boy")
        return bw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout() {
        addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
