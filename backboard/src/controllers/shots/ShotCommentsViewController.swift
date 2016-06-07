//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import PromiseKit

class ShotCommentsViewController: UITableViewController {
    private var dataSource: ShotCommentsDataSource!

    var shot: Shot!
    var delegate: ShotCommentsDelegate?

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.shot = shot

        dataSource = ShotCommentsDataSource(shot)
        tableView.dataSource = dataSource

        dataSource.loadComments().then { _ -> Void in
            self.tableView.reloadData()
            self.delegate?.commentsDidReload()
        }
    }

}

private class ShotCommentsDataSource: NSObject, UITableViewDataSource {
    let store = Store.instance

    var shot: Shot

    var comments: [Comment] = []
    var loading = false

    init(_ shot: Shot) {
        self.shot = shot

        super.init()
    }

    func loadComments() -> Promise<AnyObject> {
        loading = true
        let promise = store.find(Comment.self, "\(shot.id)/comments")
        promise.then { data -> Void in
            self.loading = false
            if let data = data as? [Comment] {
                self.comments.appendContentsOf(data)
            }
        }
        return promise
    }

    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

protocol ShotCommentsDelegate {
    func commentsDidReload()
}
