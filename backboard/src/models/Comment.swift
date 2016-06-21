//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit

import SwiftyJSON
import DTCoreText

class Comment: Model {
    var id = 0

    var body = ""

    var likesCount = 0

    var user: User?

    var attributedBody: NSAttributedString {
        let emptyString = NSAttributedString(string: "")
        let font = UIFont.systemFontOfSize(12)
        let options = [
            DTDefaultFontFamily: font.familyName,
            DTDefaultFontName: font.fontName,
            DTUseiOS6Attributes: NSNumber(bool: true)
        ]

        guard let data: NSData = self.body.dataUsingEncoding(NSUTF8StringEncoding) else { return emptyString }
        let builder = DTHTMLAttributedStringBuilder(HTML: data, options: options, documentAttributes: nil)
        let attributedString = builder.generatedAttributedString()

        let mutableString = NSMutableAttributedString(attributedString: attributedString)
        let range = NSMakeRange(0, attributedString.length)
        mutableString
            .mutableString
            .replaceOccurrencesOfString("\n",
                withString: "",
                options: NSStringCompareOptions.CaseInsensitiveSearch,
                range: range)

        return mutableString
    }

    convenience init(_ json: JSON) {
        self.init(json, Comment.JSONInboundMapping)

        if let user = json["user"].dictionary {
            self.user = User(JSON(user))
        }
    }

    override class var JSONInboundMapping: [String: String] {
        return [
            "id": "id",
            "body": "body",
            "likes_count": "likesCount"
        ]
    }

    override class var APIEndpoint: String {
        return "/shots"
    }

    override class func extractFind(response: JSON) -> AnyObject {
        return Comment(response)
    }

    override class func extractFindMany(response: JSON) -> [AnyObject] {
        guard let data = response.array else { return [Empty()] }
        return data.map { json -> Comment in
            return Comment(json)
        }
    }

}
