//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

enum StatType {
    case Views, Likes, Comments
}

class ShotStatView: UIView {
    var type: StatType!

    convenience init(type: StatType) {
        self.init(frame: CGRectZero)

        self.type = type
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
