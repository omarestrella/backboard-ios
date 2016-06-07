//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit

class ShotDetailViewController: UIViewController, ShotCommentsDelegate {
    let scrollView = UIScrollView()

    var shot: Shot!

    var navigationBar: UINavigationBar!

    var comments: ShotCommentsViewController!

    var statsBar: ShotStatsBarView!
    var shotImage: ShotDetailImageView!
    var headerBar: ShotDetailHeaderView!

    convenience init(shot: Shot) {
        self.init(nibName: nil, bundle: nil)

        self.view.backgroundColor = Colors.White
        self.shot = shot
        self.title = "Shot"

        self.comments = ShotCommentsViewController(shot: shot)
        comments.delegate = self

        navigationBar = navigationController?.navigationBar
        shotImage = ShotDetailImageView(shot: shot)
        statsBar = ShotStatsBarView(shot: shot)
        headerBar = ShotDetailHeaderView(shot: shot)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        view.addSubview(scrollView)
        scrollView.addSubview(headerBar)
        scrollView.addSubview(shotImage)
        scrollView.addSubview(statsBar)

        setupScrollView()
        setupComments()
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

    func setupComments() {
        self.addChildViewController(comments)
        scrollView.addSubview(comments.tableView)

        comments.tableView.snp_makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.top.equalTo(statsBar.snp_bottom)
        }

        let height = comments.tableView.contentSize.height
        scrollView.contentSize.height += height
        comments.tableView.snp_updateConstraints { make in
            make.height.equalTo(height)
        }

        comments.didMoveToParentViewController(self)
    }

    func setupHeader() {
        headerBar.snp_makeConstraints { make in
            let height = 70
            make.top.width.equalTo(scrollView)
            make.height.equalTo(height)

            scrollView.contentSize.height += CGFloat(height)
        }
    }

    func setupImage() {
        shotImage.snp_makeConstraints { make in
            make.top.equalTo(headerBar.snp_bottom)
            make.width.equalTo(scrollView)

            let height = CGFloat(self.shot.height) * (self.view.frame.width / CGFloat(self.shot.width))
            make.height.equalTo(height)
            scrollView.contentSize.height += height
        }
    }

    func setupStats() {
        statsBar.snp_makeConstraints { make in
            let height = 35

            make.top.equalTo(shotImage.snp_bottom)
            make.width.equalTo(scrollView)
            make.height.equalTo(height)

            scrollView.contentSize.height += CGFloat(height)
        }
    }

    func commentsDidReload() {
        let height = comments.tableView.contentSize.height
        comments.tableView.snp_updateConstraints { make in
            make.height.equalTo(height)
        }
        self.scrollView.contentSize.height += height
    }

}
