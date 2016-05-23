//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Empty {}

class Model: NSObject {
    class var JSONInboundMapping: [String: String] {
        return [:]
    }

    class var APIEndpoint: String {
        return ""
    }

    var data: JSON = JSON([:])

    init(_ json: JSON, _ mappings: [String: String]) {
        super.init()

        for (from, to) in mappings {
            self.setValue(json[from].stringValue, forKeyPath: to)
        }

        self.data = json
    }

    class func extract(model: Model.Type, response: JSON, type: String) -> AnyObject {
        switch type {
        case "find":
            return model.extractFind(response)
        case "findMany":
            return model.extractFindMany(response)
        default:
            return [:]
        }
    }

    class func extractFind(response: JSON) -> AnyObject {
        return Empty()
    }

    class func extractFindMany(response: JSON) -> [AnyObject] {
        return [Empty()]
    }

}
