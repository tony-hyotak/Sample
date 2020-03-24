//
//  AppDelegate.swift
//  SampleCatalyst
//
//  Created by tony.hyotak on 2020/03/24.
//  Copyright © 2020 tony.hyotak. All rights reserved.
//

import UIKit
import SampleEngine
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared = UIApplication.shared.delegate as! AppDelegate
    
    private let disposeBag = DisposeBag()
    let engine: SampleEngineProtocol = SampleEngine.default
    private var accountService: AccountServiceProvider!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        engine.initialize()
        self.accountService = engine.accountService()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.accountService.signIn(id: "abcd", pw: "1234")
                .subscribe(onNext: { (result) in
                    switch result {
                    case .success(_):
                        break
                    case .failure(_):
                        break
                    }
                }).disposed(by: self.disposeBag)
        }

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

