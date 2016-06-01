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

    var shotImage: ShotDetailImageView!
    var navigationBar: UINavigationBar!

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.shot = shot
        self.title = shot.title

        view.backgroundColor = Colors.White
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

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
        scrollView.addSubview(shotImage)
        shotImage.snp_makeConstraints { make in
            make.top.equalTo(scrollView)
            make.width.equalTo(scrollView)

            let height = CGFloat(self.shot.height) * (self.view.frame.width / CGFloat(self.shot.width))
            make.height.equalTo(height)
        }
    }

}
