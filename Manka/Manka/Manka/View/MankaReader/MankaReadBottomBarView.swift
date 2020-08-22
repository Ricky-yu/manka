//
//  MankaReadBottomBarView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/22.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import SnapKitExtend


class MankaReadBottomBarView: UIView {
    
    lazy var menuSlider: UISlider = {
        let menuSlider = UISlider()
        menuSlider.thumbTintColor = UIColor.green
        menuSlider.minimumTrackTintColor = UIColor.green
        menuSlider.isContinuous = false
        return menuSlider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(menuSlider)
        menuSlider.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40))
            make.height.equalTo(30)
            
        }
    }
}
