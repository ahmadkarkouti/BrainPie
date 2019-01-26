//
//  MainTabBarController.swift
//  BrainPie
//
//  Created by Franck-Stephane Ndame Mpouli on 26/01/2019.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewController()
        tabBar.isTranslucent = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.05
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        tabBar.layer.shadowRadius = 5
        
    }
    
    func setupViewController() {
        
        viewControllers = [[HomeViewController(), "Home"],
                           [QuizViewController(), "ChatBot"],
                           [QuizViewController(), "Capture"],
                           [SettingsViewController(), "Settings"]].map { (vc) -> UINavigationController in
                            let nv = UINavigationController(rootViewController: vc[0] as! UIViewController)
                            nv.tabBarItem.title = vc[1] as? String
                            return nv
        }
        tabBar.tintColor = .black
        
        // modifiy tab bar item insets
        guard let items = tabBar.items else {return}
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
