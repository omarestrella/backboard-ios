//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        tabBar.tintColor = Colors.White
        tabBar.selectedImageTintColor = Colors.White
        tabBar.barTintColor = Colors.Pink

        setupViewControllers()
    }

    func setupViewControllers() {
        let shots = ShotsNavigationController(title: "Shots")
#if DEBUG
        let search = SearchNavigationController(title: "Search")
        self.viewControllers = [shots, search]
#else
        self.viewControllers = [shots]
#endif

        tabBar.hidden = true
    }

}
