//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import Ripper

class ShotImageView: UIImageView {
    var shot: Shot? = nil
    var operation: Operation?

    func reset() {
        operation?.cancel()
        self.layer.opacity = 0
        self.image = nil
    }

    convenience init(shot: Shot) {
        self.init(frame: CGRectZero)

        self.shot = shot

        if let teaser = shot.teaserImage, url = teaser.url {
            operation = Ripper.downloader.load(url: url)
            operation?.execute { (image, error) -> Void in
                self.layer.opacity = 0

                self.image = image
                UIView.animateWithDuration(0.5, animations: {
                    self.layer.opacity = 1.0
                })
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
