//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation

import Alamofire
import netfox
import PromiseKit
import SwiftyJSON

class RequestManager: Alamofire.Manager {
    static let sharedManager: RequestManager = {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.protocolClasses?.insert(NFXProtocol.self, atIndex: 0)
        configuration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
        let manager = RequestManager(configuration: configuration)
        return manager
    }()

    static func request(method: Alamofire.Method,
                        _ URLString: URLStringConvertible,
                        parameters: [String: AnyObject]? = nil,
                        encoding: ParameterEncoding = .JSON,
                        headers: [String: String]? = nil) -> Promise<JSON> {
        return Promise { resolve, reject in
            RequestManager.sharedManager.request(method, URLString,
                parameters: parameters, encoding: encoding, headers: headers).responseJSON { response in
                if let data = response.data {
                    switch response.result {
                    case .Success:
                        resolve(JSON(data: data))
                    case .Failure(let error):
                        reject(error)
                    }
                }
            }
        }
    }

}
