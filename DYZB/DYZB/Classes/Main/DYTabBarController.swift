//
//  DYTabBarController.swift
//  DYZB
//
//  Created by YouTou on 2019/12/27.
//  Copyright © 2019 lxn. All rights reserved.
//

import UIKit

class DYTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.isTranslucent = false
//        self.tabBar.tintColor = UIColor.orange //或者在delega的deapperence全局设置
        self.delegate = self
        
        let tabTitles = ["首页", "直播", "关注", "我的"]
        
        addChildVC(HomeViewController(), childName: tabTitles[0], image: "btn_home_normal", selectedImage: "btn_home_selected")
        addChildVC(HomeViewController(), childName: tabTitles[1], image: "btn_column_normal", selectedImage: "btn_column_selected")
        addChildVC(HomeViewController(), childName: tabTitles[2], image: "btn_live_normal", selectedImage: "btn_live_selected")
        addChildVC(HomeViewController(), childName: tabTitles[3], image: "btn_user_normal", selectedImage: "btn_user_selected")
        
    }
    
    fileprivate func addChildVC(_ childController: UIViewController, childName : String, image : String, selectedImage: String) {
//        guard let childVC = UIViewController else {
//            return
//        }
        let tabBarItem = UITabBarItem(title: childName, image: UIImage(named: image), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
//        tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key : UIFont.systemFont(ofSize: 14),], for: .normal)
//        tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key : UIFont.systemFont(ofSize: 14), kCTForegroundColorAttributeName as NSAttributedString.Key : UIColor.orange], for: .selected)
        
        childController.tabBarItem = tabBarItem
        
        let childNaviVC = UINavigationController(rootViewController: childController)
        childNaviVC.navigationBar.isTranslucent = false
        let backItem = UIBarButtonItem()
        backItem.title = ""
        childController.navigationItem.backBarButtonItem = backItem
        
        addChild(childNaviVC)
    }

    
    // MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let willSelectIndex = self.viewControllers?.firstIndex(of: viewController) ?? 0
        print("select tab index [\(willSelectIndex)]")

        guard willSelectIndex == 0 else {
            self.selectedIndex = willSelectIndex
            return false
        }
        
        return true
    }
    
}
