//
//  MankaSetting.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/11.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import MJRefresh

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height


// colorSetting
extension UIColor {
    class var background: UIColor {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    class var nvblue: UIColor {
        return UIColor(red: 24/255, green: 136/255, blue: 146/255, alpha: 1.0)
    }
    
    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

// SnapKit
extension ConstraintView {
    
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}
