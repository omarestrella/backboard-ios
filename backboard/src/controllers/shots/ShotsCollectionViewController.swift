//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotsCollectionViewController: UICollectionViewController {

    convenience init(title: String) {
        let layout = UICollectionViewFlowLayout()
        self.init(collectionViewLayout: layout)

        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = Colors.White
    }

}
