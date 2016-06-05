//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher

class ShotImageView: UIImageView {
    var shot: Shot? = nil
    var task: RetrieveImageTask?

    func reset() {
        task?.cancel()
        image = nil
    }

    convenience init(shot: Shot) {
        self.init(frame: CGRectZero)

        self.shot = shot

        if let teaser = shot.teaserImage, url = teaser.url, URL = NSURL(string: url) {
            task = self.kf_setImageWithURL(URL, placeholderImage: nil)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
