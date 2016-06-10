//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SnapKit
import Kingfisher

class ShotCommentTableViewCell: UITableViewCell {
    let userImage = UIImageView()
    let usernameLabel = UILabel()
    let bodyLabel = UILabel()

    func setupCell(_ comment: Comment) {
        selectionStyle = .None

        setupImage(comment)
        setupUsernameLabel(comment)
        setupBodyLabel(comment)

        contentView.sizeToFit()
    }

    func setupImage(_ comment: Comment) {
        if let url = comment.user?.avatarUrl, URL = NSURL(string: url) {
            userImage.kf_setImageWithURL(URL, placeholderImage: nil)
        }

        contentView.addSubview(userImage)
        userImage.snp_makeConstraints { make in
            make.top.left.equalTo(self.contentView).offset(8)
            make.height.width.equalTo(32)
            make.bottom.greaterThanOrEqualTo(8).priorityLow()
        }
    }

    func setupUsernameLabel(_ comment: Comment) {
        contentView.addSubview(usernameLabel)
        usernameLabel.snp_makeConstraints { make in
            make.left.equalTo(userImage.snp_right).offset(8)
            make.top.right.equalTo(self.contentView).inset(UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 8))
        }

        guard let name = comment.user?.displayName else { return }

        usernameLabel.text = name
        usernameLabel.font = UIFont.systemFontOfSize(13)
    }

    func setupBodyLabel(_ comment: Comment) {
        contentView.addSubview(bodyLabel)
        bodyLabel.snp_makeConstraints { make in
            make.top.equalTo(usernameLabel.snp_bottom).offset(0)
            make.left.equalTo(userImage.snp_right).offset(8)
            make.bottom.right.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 8))
        }

        bodyLabel.attributedText = comment.attributedBody
        bodyLabel.numberOfLines = 0
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
