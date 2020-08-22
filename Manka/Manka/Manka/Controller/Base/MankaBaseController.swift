//
//  MankaBaseController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/11.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class MankaBaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.background
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func setupLayout() {}
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "nav_back_white"), for: .normal)
            button.addTarget(self, action: #selector(pressBack), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension MankaBaseController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
