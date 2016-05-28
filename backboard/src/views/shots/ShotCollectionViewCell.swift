//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    var imageView: ShotImageView? = nil

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView = nil
    }

    func loadShotData(shot: Shot) {
        imageView = ShotImageView(shot: shot)

        if let imageView = imageView {
            self.addSubview(imageView)

            imageView.snp_makeConstraints { make in
                make.width.height.equalTo(self)
            }
        }
    }

}
