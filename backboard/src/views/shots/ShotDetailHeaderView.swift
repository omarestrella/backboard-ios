//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit

class ShotDetailHeaderView: BaseView {
    var shot: Shot!

    let shotTitleLabel = UILabel()
    let shotAuthorLabel = UILabel()

    init(shot: Shot) {
        super.init(frame: CGRectZero)

        self.shot = shot
        self.backgroundColor = Colors.Charcoal

        setupView()
    }

    func setupView() {
        shotTitleLabel.text = shot.title
        shotTitleLabel.font = UIFont.systemFontOfSize(16)
        shotTitleLabel.textColor = Colors.White

        if let name = shot.user?.displayName {
            shotAuthorLabel.text = "by \(name)"
        }
        shotAuthorLabel.font = UIFont.systemFontOfSize(12)
        shotAuthorLabel.textColor = Colors.White

        let views = [
            shotTitleLabel,
            shotAuthorLabel
        ]

        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .Vertical
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = -20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        stackView.snp_makeConstraints { make in
            make.top.right.bottom.left.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
