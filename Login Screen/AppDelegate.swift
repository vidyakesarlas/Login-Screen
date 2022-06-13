//
//  AppDelegate.swift
//  Login Screen
//
//  Created by vidya.k on 11/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var isUserLoggedIn: Bool = false
    var window: UIWindow?
    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navBarApp = UINavigationBar.appearance()
        navBarApp.backgroundColor = .systemBlue
        navBarApp.barTintColor = .white
        navBarApp.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
     //   let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if let isLogin = UserDefaults.standard.object(forKey: "login") as? Bool {

           //If already login then show Dashboard screen
           self.showDashboardScreen()
        } else {

           //If not login then show Login screen
           self.showLoginScreen()
        }
        
        return true
    }

    func showLoginScreen() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController: ViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController

         var navigationController = UINavigationController()
         navigationController = UINavigationController(rootViewController: loginViewController)

         //It removes all view controllers from the navigation controller then sets the new root view controller and it pops.
         window?.rootViewController = navigationController

         //Navigation bar is hidden
         navigationController.isNavigationBarHidden = true
    }

    func showDashboardScreen() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardViewController: MenuViewController = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController

         var navigationController = UINavigationController()
    navigationController = UINavigationController(rootViewController: dashboardViewController)

         //It removes all view controllers from the navigation controller then sets the new root view controller and it pops.
         window?.rootViewController = navigationController

         //Navigation bar is hidden
         navigationController.isNavigationBarHidden = true
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

