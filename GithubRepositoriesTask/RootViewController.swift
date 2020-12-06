//
//  RootViewController.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/6/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation
import UIKit

final class RootViewController {

    class func initialized() -> UIViewController {
        let githubRepoService: GithubRepositoryServiceInterface = self.getRepositoryService(headers: nil)
        let githubRepositoriesViewController: GithubRepositoriesViewController = GithubRepositoriesViewController(githubRepositoryService: githubRepoService)
        let rootViewController: UINavigationController = UINavigationController(rootViewController: githubRepositoriesViewController)
        return rootViewController
    }

    private class func getRepositoryService(headers: [String: String]?) -> GithubRepositoryServiceInterface {
        let requestHandler: RequestHandler = GithubFetcher(headers: headers)
       let responseDecoder: ResponseDecoder = GithubRepositoriesDecoder()
       let githubRepositoryRepo: GithubRepositoryReposioryInterface = GithubRepositoryRepository(requestHandler: requestHandler, responseDecoder: responseDecoder)

        return GithubRepositoryService(githubRepositoryRepo: githubRepositoryRepo)
    }

}
