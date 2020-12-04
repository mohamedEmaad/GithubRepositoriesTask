//
//  AppDelegate.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let requestHandler: RequestHandler = GithubFetcher(headers: nil)
        let responseDecoder: ResponseDecoder = GithubRepositoriesDecoder()
        let requestFilterer: RequestFilterer = GithubRepositoryRequestFilterer()
        let githubRepositoryRepo: GithubRepositoryRepo = GithubRepositoryRepoImp(requestHandler: requestHandler, responseDecoder: responseDecoder, requestFilterer: requestFilterer)
        let githubRepoService: GithubRepositoryService = GithubRepositoryServiceImp(githubRepositoryRepo: githubRepositoryRepo)
        let githubRepositoriesViewController: GithubRepositoriesViewController = GithubRepositoriesViewController(githubRepoService: githubRepoService)
        let initialViewController: UINavigationController = UINavigationController(rootViewController: githubRepositoriesViewController)
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
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

