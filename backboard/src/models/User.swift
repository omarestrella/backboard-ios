//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import SwiftyJSON

class User: Model {
    dynamic var id = 0

    dynamic var name = ""
    dynamic var username = ""

    dynamic var htmlUrl = ""
    dynamic var avatarUrl = ""

    var displayName: String {
        if !name.isEmpty {
            return name
        } else if !username.isEmpty {
            return username
        }

        return "Author"
    }

    convenience init(_ json: JSON) {
        self.init(json, User.JSONInboundMapping)
    }

    override class var JSONInboundMapping: [String: String] {
        return [
            "id": "id",
            "name": "name",
            "username": "username",
            "html_url": "htmlUrl",
            "avatar_url": "avatarUrl"
        ]
    }

    override class var APIEndpoint: String {
        return "/users"
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
