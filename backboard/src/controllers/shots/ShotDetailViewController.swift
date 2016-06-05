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

    var navigationBar: UINavigationBar!

    var statsBar: ShotStatsBarView!
    var shotImage: ShotDetailImageView!
    var headerBar: ShotDetailHeaderView!

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.shot = shot
        self.title = "Shot"

        view.backgroundColor = Colors.White
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationBar = navigationController?.navigationBar
        shotImage = ShotDetailImageView(shot: shot)
        statsBar = ShotStatsBarView(shot: shot)
        headerBar = ShotDetailHeaderView(shot: shot)

        setupScrollView()
        setupHeader()
        setupImage()
        setupStats()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.frame = view.frame
        scrollView.snp_makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view)
        }
    }

    func setupHeader() {
        scrollView.addSubview(headerBar)
        headerBar.snp_makeConstraints { make in
            let height = 70
            make.top.width.equalTo(scrollView)
            make.height.equalTo(height)

            scrollView.contentSize.height += CGFloat(height)
        }
    }

    func setupImage() {
        scrollView.addSubview(shotImage)
        shotImage.snp_makeConstraints { make in
            make.top.equalTo(headerBar.snp_bottomMargin)
            make.width.equalTo(scrollView)

            let height = CGFloat(self.shot.height) * (self.view.frame.width / CGFloat(self.shot.width))
            make.height.equalTo(height)
            scrollView.contentSize.height += height
        }
    }

    func setupStats() {
        scrollView.addSubview(statsBar)
        statsBar.snp_makeConstraints { make in
            let height = 35

            make.top.equalTo(shotImage.snp_bottomMargin)
            make.width.equalTo(scrollView)
            make.height.equalTo(height)

            scrollView.contentSize.height += CGFloat(height)
        }
    }

}
