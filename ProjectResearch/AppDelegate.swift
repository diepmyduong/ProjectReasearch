//
//  AppDelegate.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import ResearchKit
import MAThemeKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var containerViewController: MainViewController? {
        return window?.rootViewController as? MainViewController
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let standardDefaults = NSUserDefaults.standardUserDefaults()
        if standardDefaults.objectForKey("ORKSampleFirstRun") == nil {
            ORKPasscodeViewController.removePasscodeFromKeychain()
            standardDefaults.setValue("ORKSampleFirstRun", forKey: "ORKSampleFirstRun")
        }
        if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
            // Hide content so it doesn't appear in the app switcher.
            containerViewController?.contentHidden = true
            lockApp()
        }
        //let sharedApplication = UIApplication.sharedApplication()
        //sharedApplication.delegate?.window??.tintColor = UIColor.greenColor()
        //MAThemeKit.setupThemeWithPrimaryColor(primaryColor, secondaryColor: secondaryColor, fontName: "HelveticaNeue-Light", lightStatusBar: true)
        return true
    }
    
    let primaryColor = MAThemeKit.colorWithR(0, g: 184, b: 156)
    let secondaryColor = UIColor.whiteColor()

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
            // Hide content so it doesn't appear in the app switcher.
            containerViewController?.contentHidden = true
            lockApp()
        }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        lockApp()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func lockApp() {
        /*
         Only lock the app if there is a stored passcode and a passcode
         controller isn't already being shown.
         */
        guard ORKPasscodeViewController.isPasscodeStoredInKeychain() && !(containerViewController?.presentedViewController is ORKPasscodeViewController) else { return }
        
        window?.makeKeyAndVisible()
        
        let passcodeViewController = ORKPasscodeViewController.passcodeAuthenticationViewControllerWithText("Chào mừng bạn trở lại \n Vui lòng nhập khoá mật khẩu", delegate: self) as! ORKPasscodeViewController
        containerViewController?.presentViewController(passcodeViewController, animated: false, completion: nil)
    }

}

extension AppDelegate: ORKPasscodeDelegate {
    func passcodeViewControllerDidFinishWithSuccess(viewController: UIViewController) {
        containerViewController?.contentHidden = false
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func passcodeViewControllerDidFailAuthentication(viewController: UIViewController) {
    }
}

