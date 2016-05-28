//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotDetailViewController: UIViewController {
    var shot: Shot!

    convenience init(shot: Shot) {
        self.init()

        self.shot = shot
        self.title = shot.title
    }

    override func viewDidLoad() {
        view.backgroundColor = Colors.White
    }

}
