//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit

class ShotStatsBarView: BaseView {
    var shot: Shot!

    init(shot: Shot) {
        super.init(frame: CGRectZero)

        self.shot = shot
        self.backgroundColor = Colors.Charcoal

        setupStatViews()
    }

    func setupStatViews() {
        let views = [
            ShotStatView(type: .Views, shot: shot),
            ShotStatView(type: .Likes, shot: shot),
            ShotStatView(type: .Comments, shot: shot)
        ]

        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.snp_makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.bottom.width.height.equalTo(self)
        }
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
