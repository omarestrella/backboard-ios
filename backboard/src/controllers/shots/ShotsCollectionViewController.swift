//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import PromiseKit
import SwiftyJSON

class ShotsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private var dataSource: CollectionViewDataSource!

    var currentPage = 1

    var refreshControl: UIRefreshControl?

    convenience init(title: String) {
        let layout = UICollectionViewFlowLayout()
        self.init(collectionViewLayout: layout)

        self.title = title

        dataSource = CollectionViewDataSource()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.delegate = self
        collectionView?.dataSource = dataSource
        collectionView?.backgroundColor = Colors.Charcoal
        collectionView?.registerClass(ShotCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        setupRefreshControl()

        dataSource.loadShots(currentPage++).then { _ -> Void in
            self.collectionView?.reloadData()
        }
    }

    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("startRefresh:"), forControlEvents: UIControlEvents.ValueChanged)
        if let refreshControl = refreshControl {
            collectionView?.addSubview(refreshControl)
        }
    }

    func startRefresh(sender: AnyObject) {
        dataSource.loadShots(0).then { _ -> Void in
            self.refreshControl?.endRefreshing()
        }
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let viewWidth = collectionView.contentSize.width
        let size = viewWidth / 3.0

        let width = size - 8
        let height = size / (4.0 / 3.0) - 8
        return CGSize(width: size - 8, height: height)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let navigation = self.navigationController
        let shot = dataSource.shots[indexPath.row]
        let vc = ShotDetailViewController(shot: shot)
        dispatch_async(dispatch_get_main_queue()) {
            navigation?.pushViewController(vc, animated: true)
        }
    }


    // MARK: UIScrollViewDelegate

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        let offset = scrollView.contentOffset.y

        if height + offset >= contentHeight - 150 {
            if !dataSource.loading {
                dataSource.loadShots(currentPage++).then { _ -> Void in
                    self.collectionView?.reloadData()
                }
            }
        }
    }


}

private class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let store = Store.instance

    var shots: [Shot] = []
    var loading = false

    func loadShots(page: Int) -> Promise<AnyObject> {
        log.debug("Loading Shots")

        loading = true
        let promise = store.find(Shot.self, ["page": page, "per_page": 24])
        promise.then { data -> Void in
            self.loading = false
            if let data = data as? [Shot] {
                self.shots.appendContentsOf(data)
            }
        }

        return promise
    }

    func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    @objc func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }

    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? ShotCollectionViewCell {
            let shot = shots[indexPath.row]
            cell.backgroundColor = Colors.Charcoal
            cell.loadShotData(shot)
            return cell
        }

        return UICollectionViewCell()
    }

}
