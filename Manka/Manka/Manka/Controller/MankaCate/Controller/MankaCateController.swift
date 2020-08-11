//
//  MankaCateController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/11.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import MJRefresh

class ManKaCateController: MankaBaseController {
    
    private var searchString = ""
    
    private lazy var searchButton: UIButton = {
        let searchBtn = UIButton(type: .system)
        searchBtn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 30)
        searchBtn.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        searchBtn.layer.cornerRadius = 15
        searchBtn.setTitleColor(.white, for: .normal)
        searchBtn.setImage(UIImage(named: "nav_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        searchBtn.addTarget(self, action:#selector(searchButtonClick), for: .touchUpInside)
        return searchBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadData()
    }
    
    private func setupLoadData() {
        searchButton.setTitle(self.searchString, for: .normal)
    }
    
    @objc private func searchButtonClick() {
        
    }
    
    override func setupLayout(){
      
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.titleView = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
}


