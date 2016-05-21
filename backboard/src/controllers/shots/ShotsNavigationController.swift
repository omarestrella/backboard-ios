//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotsNavigationController: UINavigationController {

    convenience init() {
        let title = "Shots"
        let vc = ShotsCollectionViewController(title: title)

        self.init(rootViewController: vc)

        self.title = title
        self.tabBarItem = UITabBarItem(title: title, image: nil, tag: 0)
        self.view.backgroundColor = Colors.White
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
