//
//  AppDelegate.swift
//  Coordinator Example
//
//  Created by yuriy.p on 13.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCoordinator: Coordinator!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let router = NavigationRouterImpl(rootController: navigationController)
        
        appCoordinator = AppCoordinator(router: router)
        appCoordinator.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

