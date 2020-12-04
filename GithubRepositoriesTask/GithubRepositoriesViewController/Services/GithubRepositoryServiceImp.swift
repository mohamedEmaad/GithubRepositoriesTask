//
//  GithubRepoServiceImp.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryServiceImp: GithubRepositoryService {

    private let githubRepositoryRepo: GithubRepositoryRepo

    init(githubRepositoryRepo: GithubRepositoryRepo) {
        self.githubRepositoryRepo = githubRepositoryRepo
    }

    func find(criteria: [String : Any?]?, completion: @escaping ([Repository]?, String?) -> Void) {
        guard let url: URL = URL(string: .baseUrl + "repositories") else {
            completion(nil, "Invalid url")
            return
        }
        githubRepositoryRepo.find(url: url, with: criteria) { (repos, error) in
            if let error = error {
                completion(nil, error.getErrorMessage())
            } else if let repos = repos {
                completion(repos, nil)
            }
        }
    }

}
