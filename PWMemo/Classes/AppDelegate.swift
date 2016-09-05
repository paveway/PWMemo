//
//  AppDelegate.swift
//  PWSimpleEditor
//
//  Created by mfuta1971 on 2016/08/24.
//  Copyright © 2016年 Paveway. All rights reserved.
//

import UIKit
import ECSlidingViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// ウィンドウ
    var window: UIWindow?

    /// スライディングビューコントローラ
    var slidingViewController: ECSlidingViewController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let documentsPath = FileUtils.getDocumentsPath()
        let rootPath = "\(documentsPath)/\(File.kRootDir)"
        FileUtils.createDir(rootPath)

        let fileListVc = FileListViewController()
        let fileListNc = UINavigationController(rootViewController: fileListVc)
        fileListNc.view.layer.shadowOpacity = 0.75
        fileListNc.view.layer.shadowRadius = 5.0
        fileListNc.view.layer.shadowColor = UIColor.blackColor().CGColor

        slidingViewController = ECSlidingViewController()
        slidingViewController.topViewController = fileListNc

        let menuLeftVc = MenuLeftViewController()
        let menuLeftNc = UINavigationController(rootViewController: menuLeftVc)
        slidingViewController.underLeftViewController = menuLeftNc

        createWindow(slidingViewController)
        return true
    }

    private func createViewController() -> UIViewController {
        let vc = FileListViewController()
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }

    private func createWindow(viewController: UIViewController) {
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        window!.rootViewController = viewController
        window!.makeKeyAndVisible()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

