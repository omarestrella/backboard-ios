//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

class TabBarItem: UITabBarItem {

    convenience init(title: String, imageName: String) {
        let image = UIImage(named: imageName)
        let mainImage = image?.imageWithAlpha(0.60)

        self.init(title: title, image: mainImage, tag: 0)
        selectedImage = image

        let normalAttributes = [
            NSForegroundColorAttributeName: Colors.White.alpha(0.60)
        ]
        setTitleTextAttributes(normalAttributes, forState: .Normal)

        let selectedAttributes = [
            NSForegroundColorAttributeName: Colors.White
        ]
        setTitleTextAttributes(selectedAttributes, forState: .Selected)
    }
}

extension UIImage {

    func imageWithAlpha(alpha: Double) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, CGFloat(0.0))

        let float = CGFloat(alpha)
        let ctx = UIGraphicsGetCurrentContext()
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        CGContextScaleCTM(ctx, 1, -1)
        CGContextTranslateCTM(ctx, 0, -area.size.height)

        CGContextSetBlendMode(ctx, .Multiply)
        CGContextSetAlpha(ctx, float)
        CGContextDrawImage(ctx, area, self.CGImage)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return newImage
    }

}
