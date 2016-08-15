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

        self.hidesBarsOnSwipe = true
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

        navigationBar.barStyle = UIBarStyle.Black
        navigationBar.translucent = false

        self.barHideOnSwipeGestureRecognizer.addTarget(self, action: Selector("onSwipe:"))
    }

    func onSwipe(recognizer: UISwipeGestureRecognizer) {
        let shouldHideStatusBar = navigationBar.frame.origin.y < 0
        UIView.animateWithDuration(0.2, animations: {

        })
    }

}
