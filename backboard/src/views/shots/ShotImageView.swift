//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import Ripper

class ShotImageView: UIImageView {
    var shot: Shot? = nil

    convenience init(shot: Shot) {
        self.init(frame: CGRectZero)

        self.shot = shot

        if let teaser = shot.teaserImage, url = teaser.url {
            Ripper.downloader.load(url: url).into(self, callback: { (image, _) in
                log.debug("Done loading image")
            })
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
