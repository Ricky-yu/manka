//
//  MankaTabBarController.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/11.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        setupLayout()
    }
    
    func setupLayout(){
        let classVC = MankaCateController()
        addChildController(classVC,
                           title: "分類",
                           image: UIImage(named: "tab_class"),
                           selectedImage: UIImage(named: "tab_class_S"))
    }
    
    func addChildController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(MankaNaviController(rootViewController: childController))
    }
}

extension MankaTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
