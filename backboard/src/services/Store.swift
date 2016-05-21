//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import PromiseKit
import SwiftyJSON

class Store {
    static let baseURLString = "https://api.dribbble.com/v1"

    static let instance = Store()

    let manager: Manager

    init() {
        let policies: [String: ServerTrustPolicy] = [
            "localhost": .DisableEvaluation
        ]
        let policyManager = ServerTrustPolicyManager(policies: policies)
        self.manager = Manager(serverTrustPolicyManager: policyManager)
    }

    func find(model: Model.Type) -> Promise<AnyObject> {
        return self.find(model, nil)
    }

    func find(model: Model.Type, _ extra: AnyObject?) -> Promise<AnyObject> {
        var url = Store.baseURLString
        if let argument = extra as? String {
            url = "\(Store.baseURLString)\(model.APIEndpoint)/\(argument)"
        } else if let argument = extra as? Dictionary<String, Any> {
            // search...
        } else {
            url = "\(Store.baseURLString)\(model.APIEndpoint)"
        }

        return Promise { fulfill, _ in
            let request = RequestManager.sharedManager.request(.GET, url)
            request.responseJSON { response in
                var type = "find"
                let json = JSON(data: response.data!)
                if let data = json.array {
                    type = "findMany"
                }

                fulfill(Model.extract(model, response: response, type: type))
            }
        }
    }

//    func findCardSets() -> Promise<Array<List>> {
//        return Promise { fulfill, _ in
//            let request = self.manager.request(Router.ReadSets())
//            request.responseJSON { response in
//                let lists = Model.extract(CardSet.self, response: response, type: "findMany") as! Array<List>
//                fulfill(lists)
//            }
//        }
//    }
}
