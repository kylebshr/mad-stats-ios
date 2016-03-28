//
//  AppDelegate.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        setUpAppearances()

        return true
    }

    func setUpAppearances() {

        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barStyle = .Black
        navBarAppearance.translucent = false
        navBarAppearance.barTintColor = UIColor(hex: "#0A2A3F")
        navBarAppearance.tintColor = UIColor.whiteColor()
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
}

