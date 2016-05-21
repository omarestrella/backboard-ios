//
//  ViewController.swift
//  backboard
//
//  Created by Omar Estrella on 4/28/16.
//  Copyright (c) 2016 bitcreative. All rights reserved.
//


import UIKit
import QuartzCore

import Hue
import SnapKit

class ViewController: UIViewController, AuthManagerDelegate {
    let authManager = AuthManager.instance

    lazy var signinButton = UIButton(type: .System)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.Pink

        authManager.delegate = self
        setupButton()
    }

    func setupButton() {
        self.view.addSubview(signinButton)
        signinButton.backgroundColor = Colors.White

        signinButton.setTitle("Sign-in", forState: .Normal)
        signinButton.setTitleColor(Colors.Pink, forState: .Normal)

        signinButton.layer.cornerRadius = 5
        signinButton.snp_makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(35)
        }

        let tap = UITapGestureRecognizer(target: self, action: Selector("didTouchSigninButton:"))
        signinButton.addGestureRecognizer(tap)
    }

    func didTouchSigninButton(sender: UITapGestureRecognizer) {
        authManager.startAuthentication()
    }

    func presentViewController(vc: UIViewController) {
        vc.modalPresentationStyle = .OverFullScreen
        self.presentViewController(vc, animated: true, completion: nil)
    }

    func authenticated() {
        self.dismissViewControllerAnimated(true, completion: {
            let vc = MainTabBarController()
            vc.modalPresentationStyle = .CurrentContext
            vc.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(vc, animated: true, completion: nil)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
