//
//  AppDelegate.swift
//  MatchPictures
//
//  Created by Денис on 14.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var appCoordinator = AppCoordinator(container: window!)
    lazy var coreDependence = CoreDependence()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        coreDependence.execute()
        appCoordinator.start()
        window?.makeKeyAndVisible()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppManager.shared.loadData().cauterize()
    }

}
