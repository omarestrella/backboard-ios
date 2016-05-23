//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Shot: Model {
    dynamic var id = 0

    dynamic var title = ""
    dynamic var shotDescription = ""

    dynamic var width = 0
    dynamic var height = 0

    dynamic var images: [String: String] = [:]

    dynamic var viewsCount = 0
    dynamic var likesCount = 0

    init(_ json: JSON) {
        super.init(json, Shot.JSONInboundMapping)
    }

    override class var JSONInboundMapping: [String: String] {
        return [
            "views_count": "viewsCount",
            "likes_count": "likesCount",
            "description": "shotDescription"
        ]
    }

    override class var APIEndpoint: String {
        return "/shots"
    }

    override class func extractFind(response: JSON) -> AnyObject {
        return Shot(response)
    }

    override class func extractFindMany(response: JSON) -> [AnyObject] {
        let array = []
        return [Empty()]
    }

}
