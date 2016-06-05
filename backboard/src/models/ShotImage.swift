//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

class ShotImage: Model {
    dynamic var type: String = ""
    dynamic var url: String? = ""

    var isAnimated: Bool {
        if let url = url {
            return url.containsString(".gif")
        }
        return false
    }

    convenience init(type: String, url: String?) {
        self.init()

        self.type = type
        self.url = url
    }
}
