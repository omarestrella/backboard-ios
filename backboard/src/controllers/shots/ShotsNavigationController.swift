//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotsNavigationController: BaseNavigationController {

    convenience init(title: String) {
        let vc = ShotsCollectionViewController(title: title)

        self.init(rootViewController: vc)

        self.title = title
        tabBarItem = TabBarItem(title: title, imageName: "tab_bar_shots")

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
