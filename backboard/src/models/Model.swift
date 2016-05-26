//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import Realm
import RealmSwift

class Empty {}

@objc class Model: Object {
    class var JSONInboundMapping: [String: String] {
        return [:]
    }

    class var APIEndpoint: String {
        return ""
    }

    var data: JSON = JSON([:])

    convenience init(_ json: JSON, _ mappings: [String: String]) {
        self.init()

        for (from, to) in mappings {
            if let string = json[from].string {
                self.setValue(string, forKeyPath: to)
            } else if let num = json[from].number {
                self.setValue(num, forKeyPath: to)
            }
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

    func ignoredProperties() -> [String] {
        return []
    }

}
