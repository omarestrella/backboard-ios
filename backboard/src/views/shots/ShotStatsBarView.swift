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

        setupViews()
    }

    func setupViews() {
        let testView1 = ShotStatView(type: .Views)
        let testView2 = ShotStatView(type: .Likes)

        let stackView = UIStackView(arrangedSubviews: [testView1, testView2])
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
