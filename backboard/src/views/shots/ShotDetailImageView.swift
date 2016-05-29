//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit
import Ripper

class ShotDetailImageView: UIView {
    let imageView = UIImageView()

    var shot: Shot!

    convenience init(shot: Shot) {
        self.init(frame: CGRectZero)

        self.shot = shot

        self.loadImage()
    }

    func loadImage() {
        addSubview(imageView)
        imageView.snp_makeConstraints { make in
            make.width.height.equalTo(self)
        }

        if let url = shot.detailImage?.url {
            Ripper.downloader
                .load(url: url)
                .into(imageView)
        }
    }

}
