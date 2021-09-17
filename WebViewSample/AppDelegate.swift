//
//  AppDelegate.swift
//  WebViewSample
//
//  Created by Rin on 2021/09/17.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController =
            UINavigationController(rootViewController: RxViewController()) // ←ここ変えるとMVPとか切り替えられる
        // navigationController.isNavigationBarHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}

