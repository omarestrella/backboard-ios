//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import RealmSwift

class Shot: Model {
    private static var cache: [Shot] = []

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

    var detailImage: ShotImage? {
        if let hidpi = self.images.filter({ $0.type == "hidpi" }).first {
            return hidpi
        }

        return self.images.filter { $0.type == "normal" }.first
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
            "id": "id",
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
            let allShots = data.map { shotData -> Shot in
                return Shot(shotData)
            }

            let currentShotIds = cache.map { $0.id }
            let shots = allShots.filter { shot in
                return currentShotIds.filter { $0 == shot.id }.isEmpty
            }
            cache.appendContentsOf(shots)
            return shots
        }
        return [Empty()]
    }

    override func ignoredProperties() -> [String] {
        return []
    }

}
