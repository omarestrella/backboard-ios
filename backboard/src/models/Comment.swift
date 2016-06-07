//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import SwiftyJSON

class Comment: Model {
    dynamic var id = 0

    dynamic var body = ""

    dynamic var likesCount = ""


    convenience init(_ json: JSON) {
        self.init(json, Comment.JSONInboundMapping)
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
        return User(response)
    }

    override class func extractFindMany(response: JSON) -> [AnyObject] {
        return [Empty()]
    }

    override func ignoredProperties() -> [String] {
        return []
    }

}
