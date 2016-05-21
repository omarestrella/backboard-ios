//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Shot: Model {
    dynamic var id = ""

    dynamic var cmc = 0
    dynamic var cost = ""

    dynamic var types = []
    dynamic var colors = []

    dynamic var text = ""

    dynamic var formats = [:]

    dynamic var editions = []

    init(_ json: JSON) {
        super.init(json, Shot.JSONInboundMapping)
    }

    override class var APIEndpoint: String {
        return "/shots"
    }

    override class func extractFind(response: Response<AnyObject, NSError>) -> AnyObject {
        let json = JSON(data: response.data!)
        return Shot(json)
    }

    override class func extractFindMany(response: Response<AnyObject, NSError>) -> [AnyObject] {
        let array = []
        let json = JSON(data: response.data!)
        return [Empty()]
    }

}
