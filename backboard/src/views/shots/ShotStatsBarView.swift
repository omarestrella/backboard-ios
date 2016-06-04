//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotStatsBarView: UIView {
    convenience init(shot: Shot) {
        self.init(frame: CGRectZero)

        self.backgroundColor = Colors.Charcoal
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
