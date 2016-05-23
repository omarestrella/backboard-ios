//
// Created by Omar Estrella
// Copyright (c) 2016 bitcreative. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

import SwiftyJSON

struct AuthManagerError {
    static let FileReadError = "Error reading credentials file"
}

class AuthManager {
    static let instance: AuthManager! = AuthManager()

    var delegate: AuthManagerDelegate?

    var clientId: String? = ""
    var clientSecret: String? = ""
    var clientAccessToken: String? = ""

    var userAccessToken = ""

    let redirectUri = "dribbble://auth"

    init() {
        let path = NSBundle.mainBundle().pathForResource("credentials", ofType: "json")

        var fileData: NSData? = nil
        if let path = path {
            do {
                fileData = try NSData(contentsOfFile: path, options: .DataReadingMappedAlways)
            } catch {
                log.error(AuthManagerError.FileReadError)
            }
        }

        if let data = fileData {
            let json = JSON(data: data)

            clientId = json["clientId"].string
            clientSecret = json["clientSecret"].string
            clientAccessToken = json["clientAccessToken"].string
        }
    }

    func startAuthentication() {
        if let id = clientId {
            let path = "https://dribbble.com/oauth/authorize?" +
                "client_id=\(id)&redirectUri=\(redirectUri)&scope=public write comment"

            guard let encodedPath = path.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            else {
                return
            }

            log.debug(encodedPath)

            if let url = NSURL(string: encodedPath) {
                let vc = SFSafariViewController(URL: url)
                self.delegate?.presentViewController(vc)
            }
        }
    }

    func exchangeCodeForAccessToken(code: String) {
        let parameters = [
            "client_id": clientId!,
            "client_secret": clientSecret!,
            "code": code
        ]
        RequestManager
            .request(.POST, "https://dribbble.com/oauth/token", parameters: parameters)
            .then { json -> Void in
                log.debug("Successful authentication: \(json)")

                if let token = json["access_token"].string {
                    self.userAccessToken = token
                }

                self.delegate?.authenticated()
            }.recover { err in
                log.error("\(err)")
            }
    }

    func storeAccessToken(token: String) {
        log.debug(token)
    }

}

protocol AuthManagerDelegate {
    func presentViewController(vc: UIViewController)
    func authenticated()
}
