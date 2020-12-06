//
//  GithubRepoServiceImp.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryService: GithubRepositoryServiceInterface {

    private let githubRepositoryRepo: GithubRepositoryReposioryInterface
    private let repositoriesUrl: String = "repositories"

    init(githubRepositoryRepo: GithubRepositoryReposioryInterface) {
        self.githubRepositoryRepo = githubRepositoryRepo
    }

    func find(criteria: [String : Any?]?, completion: @escaping (Result<[Repository]?>) -> Void) {
        guard let url: URL = URL(string: .baseUrl + repositoriesUrl) else {
            completion(.error(errorMessage: "CallApi:InvalidUrl".localized))
            
            return
        }

        githubRepositoryRepo.find(url: url, with: criteria, completion: completion)
    }

}
