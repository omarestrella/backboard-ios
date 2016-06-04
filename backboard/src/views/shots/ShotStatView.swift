//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

enum StatType {
    case Views, Likes, Comments
}

class ShotStatView: BaseView {
    var type: StatType = .Views

    init(type: StatType) {
        super.init(frame: CGRectZero)

        self.type = type

        setupView()
    }

    func setupView() {
        var label = UILabel()
        label.textColor = Colors.White
        switch type {
        case .Views:
            label.text = "Views"
            break
        case .Comments:
            label.text = "Comments"
            break
        case .Likes:
            label.text = "Likes"
            break
        default:
            label.text = "Default"
            break
        }

        self.addSubview(label)
        label.snp_makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
