//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit

class ShotDetailViewController: UIViewController {
    var shot: Shot!

    var scrollView = UIScrollView()
    var shotImage: ShotDetailImageView?

    var navigationBar: UINavigationBar!

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.shot = shot
        self.title = shot.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.White

        navigationBar = navigationController?.navigationBar
        shotImage = ShotDetailImageView(shot: shot)

        self.setupScrollView()
        self.setupImage()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { make in
            let top = navigationBar.frame.height
            make.top.left.bottom.right.equalTo(self.view).inset(UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0))
        }
    }

    func setupImage() {
        if let shotImage = shotImage {
            scrollView.addSubview(shotImage)
            shotImage.snp_makeConstraints { make in
                make.top.equalTo(self.view)
                make.width.equalTo(self.view)

                let height = CGFloat(self.shot.height) * (self.view.frame.width / CGFloat(self.shot.width))
                make.height.equalTo(height)
            }
        }
    }

}
