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
        tabBarItem = UITabBarItem(title: title, image: UIImage(named: "tab_bar_shots"), tag: 0)

        view.backgroundColor = Colors.White

        navigationBar.tintColor = Colors.White
        navigationBar.barTintColor = Colors.Pink
        var textAttributes: [String: AnyObject] = [:]
        textAttributes[NSForegroundColorAttributeName] = Colors.White
        navigationBar.titleTextAttributes = textAttributes
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
