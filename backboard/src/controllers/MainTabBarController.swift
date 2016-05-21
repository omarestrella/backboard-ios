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

        setupViewControllers()
    }

    func setupViewControllers() {
        let shots = ShotsNavigationController()
        self.viewControllers = [shots]
    }

}
