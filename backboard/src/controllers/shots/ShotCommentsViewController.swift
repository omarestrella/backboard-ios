//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotCommentsViewController: UITableViewController {
    var shot: Shot!

    let dataSource = ShotCommentsDataSource()

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.shot = shot
        self.tableView.dataSource = dataSource

        tableView.reloadData()
    }

}

class ShotCommentsDataSource: NSObject, UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
