//
//  AppDelegate.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/27/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

import OHHTTPStubs

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        useHTTPStub()
        return true
    }
    
    func useHTTPStub() {
        var textStub: OHHTTPStubsDescriptor?
        let stubPath = OHPathForFile("ticket_20073776662724.json", type(of: self))
        guard let regex = try? NSRegularExpression(pattern: "(.*)route/ticket/(.*)", options: NSRegularExpression.Options.caseInsensitive) else {
            return
        }
        textStub = stub(condition: pathMatches(regex)) {_ in
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                .requestTime(0.0, responseTime:OHHTTPStubsDownloadSpeedWifi)
        }
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

