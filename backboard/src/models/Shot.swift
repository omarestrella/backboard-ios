//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import RealmSwift

class Shot: Model {
    dynamic var id = 0

    dynamic var title = ""
    dynamic var shotDescription = ""

    dynamic var width = 0
    dynamic var height = 0

    dynamic var viewsCount = 0
    dynamic var likesCount = 0

    var images = List<ShotImage>()

    var teaserImage: ShotImage? {
        return self.images.filter { $0.type == "teaser" }.first
    }

    convenience init(_ json: JSON) {
        self.init(json, Shot.JSONInboundMapping)

        if let images = data["images"].dictionary {
            let models: [ShotImage] = images.map { (key: String, value: JSON) in
                let url = value.string
                return ShotImage(type: key, url: url)
            }
            self.images.appendContentsOf(models)
        }
    }

    override class var JSONInboundMapping: [String: String] {
        return [
            "title": "title",
            "description": "shotDescription",
            "width": "width",
            "height": "height",
            "views_count": "viewsCount",
            "likes_count": "likesCount",
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
        if let data = response.array {
            return data.map { shotData in
                return Shot(shotData)
            }
        }
        return [Empty()]
    }

    override func ignoredProperties() -> [String] {
        return []
    }

}
