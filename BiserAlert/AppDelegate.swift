//
//  AppDelegate.swift
//  BiserAlert
//
//  Created by Дмитрий Бисеров on 02.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.black
        self.window?.rootViewController = UINavigationController(rootViewController: BiserAlert()) 
        window?.makeKeyAndVisible()
        
        return true
    }


}

