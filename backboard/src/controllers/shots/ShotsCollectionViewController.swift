//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import PromiseKit
import SwiftyJSON

class ShotsCollectionViewController: UICollectionViewController {
    private let delegate = CollectionViewDelegate()
    private let dataSource = CollectionViewDataSource()

    convenience init(title: String) {
        let layout = UICollectionViewFlowLayout()
        self.init(collectionViewLayout: layout)

        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.delegate = delegate
        collectionView?.dataSource = dataSource
        collectionView?.backgroundColor = Colors.White

        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        dataSource.loadShots().then { (shots) -> Void in
            self.collectionView?.reloadData()
        }
    }

}

@objc private class CollectionViewDelegate: NSObject, UICollectionViewDelegate {

}

private class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let store = Store.instance

    func loadShots() -> Promise<AnyObject> {
        log.debug("Loading Shots")

        let promise = store.find(Shot)
        promise.then { data in
            log.debug("\(data)")
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
        return 10
    }

    @objc func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = Colors.Charcoal
        return cell
    }

}
