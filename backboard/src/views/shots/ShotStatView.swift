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
    var shot: Shot!
    var type: StatType = .Views

    init(type: StatType, shot: Shot) {
        self.type = type
        self.shot = shot

        super.init(frame: CGRectZero)

        setupView()
    }

    func setupView() {
        var label = UILabel()
        label.textColor = Colors.White
        label.font = UIFont.systemFontOfSize(14)

        switch type {
        case .Views:
            label.text = "\(shot.viewsCount) Views"
            break
        case .Comments:
            label.text = "\(shot.commentsCount) Comments"
            break
        case .Likes:
            label.text = "\(shot.likesCount) Likes"
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
