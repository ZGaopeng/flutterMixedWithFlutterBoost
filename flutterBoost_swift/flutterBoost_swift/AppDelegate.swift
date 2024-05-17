//
//  AppDelegate.swift
//  flutterBoost_swift
//
//  Created by 小瓶子 on 2023/5/25.
//

import UIKit
import flutter_boost
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var navi: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let delegate = BoostDelegate()
        FlutterBoost.instance().setup(application, delegate: delegate) { engine in
            
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .red
        
        UITabBar.appearance().tintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.orange
        let homeVc = HomeViewController()
        homeVc.tabBarItem = UITabBarItem(title: "首页", image: nil, tag: 99)
        let fvc1  = FBFlutterViewContainer()!
        fvc1.setName("tab1", uniqueId: nil, params: nil, opaque: true)
        fvc1.tabBarItem = UITabBarItem(title: "flutter_tab1", image: nil, tag: 1)
        let tabBar = UITabBarController()
        tabBar.setViewControllers([homeVc,fvc1], animated: true)
        navi = UINavigationController(rootViewController: tabBar)
        navi!.navigationBar.isHidden = true
        delegate.navigationController = navi
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }

}

