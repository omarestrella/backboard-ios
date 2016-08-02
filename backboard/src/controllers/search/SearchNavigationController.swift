//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class SearchNavigationController: BaseNavigationController {

    convenience init(title: String) {
        let vc = SearchController(searchResultsController: SearchResultsController())
        vc.title = title

        self.init(rootViewController: vc)

        self.title = title
        tabBarItem = TabBarItem(title: title, imageName: "tab_bar_search")

        view.backgroundColor = Colors.White

        navigationBar.tintColor = Colors.White
        navigationBar.barTintColor = Colors.Pink
        var textAttributes: [String: AnyObject] = [:]
        textAttributes[NSForegroundColorAttributeName] = Colors.White
        navigationBar.titleTextAttributes = textAttributes
    }
}
