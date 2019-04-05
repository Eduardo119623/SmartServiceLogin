//
//  AppDelegate.swift
//  LoginSmartService
//
//  Created by Esfera Estudio S de RL de CV on 4/2/19.
//  Copyright © 2019 Esfera Estudio S de RL de CV. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var ref: DatabaseReference!
    var batteryLevel: Float = 0
    var control: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if !control {
            UIDevice.current.isBatteryMonitoringEnabled = true
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(getBatteryLevel), userInfo: nil, repeats: true)
            self.control = true
        }
        
        
        
       // NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange(_:)), name: , coder: nil)
        
    }
   
    @objc func getBatteryLevel(){
        let battery = UIDevice.current.batteryLevel
           
        self.batteryLevel = battery * 100
        ref = Database.database().reference()
        self.ref.child("system").childByAutoId().setValue(self.batteryLevel)
        print(battery)
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

