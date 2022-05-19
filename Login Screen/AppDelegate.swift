//
//  AppDelegate.swift
//  Login Screen
//
//  Created by vidya.k on 11/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
//        
//        let height = 300
//                
//        let navbar = UINavigationBar()
//        navbar.frame.size.width = UIScreen.main.bounds.size.width
//        navbar.frame.size.height = CGFloat(height)
//        navbar.frame = CGRect(x: 0,
//                              y: 0,
//                              width: navbar.frame.size.width,
//                              height: navbar.frame.size.height)
        
        
        
        
        let navBarApp = UINavigationBar.appearance()
        navBarApp.backgroundColor = .systemBlue
        navBarApp.barTintColor = .white
        navBarApp.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navBarApp.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            navBarApp.heightAnchor.constraint(equalToConstant: 100)
//        ])
       
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

