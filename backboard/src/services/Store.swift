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

    func find(model: Model.Type, _ params: AnyObject?) -> Promise<AnyObject> {
        var url = Store.baseURLString
        var parameters: [String: AnyObject]? = nil

        if let argument = params as? String {
            url = "\(Store.baseURLString)\(model.APIEndpoint)/\(argument)"
        } else {
            url = "\(Store.baseURLString)\(model.APIEndpoint)"
        }

        if let argument = params as? [String: AnyObject] {
            parameters = argument
        }

        return Promise { fulfill, _ in
            let request = RequestManager.request(.GET, url, parameters: parameters, encoding: .URL).then { (json) -> Void in
                var type = "find"
                if let data = json.array {
                    type = "findMany"
                }

                log.debug("Successful store query for: \(model), \(params)")

                fulfill(Model.extract(model, response: json, type: type))
            }
        }
    }

}
