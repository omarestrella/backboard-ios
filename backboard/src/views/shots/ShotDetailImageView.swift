//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit
import Kingfisher
import Gifu

class ShotDetailImageView: UIView {
    var placeholderImage: UIImageView!
    var imageView: UIImageView!

    var shot: Shot!

    init(shot: Shot) {
        self.shot = shot
        if shot.isAnimated {
            imageView = AnimatedImageView()
        } else {
            imageView = UIImageView()
        }

        placeholderImage = UIImageView()

        super.init(frame: CGRectZero)

        self.loadImage()
    }

    func loadImage() {
        if let url = shot.teaserImage?.url, URL = NSURL(string: url) {
            placeholderImage.kf_setImageWithURL(URL, placeholderImage: nil)
        }
        if let url = shot.detailImage?.url, URL = NSURL(string: url) {
            imageView.kf_setImageWithURL(URL, placeholderImage: placeholderImage.image)
        }

        addSubview(imageView)
        imageView.snp_makeConstraints { make in
            make.top.width.height.equalTo(self)
        }
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
