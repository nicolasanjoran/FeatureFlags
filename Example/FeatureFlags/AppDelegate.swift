//
//  AppDelegate.swift
//  FeatureFlags
//
//  Created by Ross Butler on 10/18/2018.
//  Copyright (c) 2018 Ross Butler. All rights reserved.
//

import UIKit
import FeatureFlags

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FeatureFlags.deleteAllFeaturesFromCache()
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let navigationSettings = ViewControllerNavigationSettings(
            autoClose: true,
            closeButtonAlignment: .closeButtonLeftActionButtonRight,
            closeButton: .done,
            isNavigationBarHidden: false)
        FeatureFlagsUI.autoRefresh = true
        FeatureFlagsUI.pushFeatureFlags(navigationController: navigationController,
                                      navigationSettings: navigationSettings)
        printInformation()
        return true
    }

    /// For testing.
    private func loadStoryboardViewController(navigationController: UINavigationController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main")
        navigationController.pushViewController(viewController, animated: true)
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}

private extension AppDelegate {

    func printInformation() {
        FeatureFlags.printFeatureFlags()
        print("\n")
        FeatureFlags.printExtendedFeatureFlagInformation()
    }

}
