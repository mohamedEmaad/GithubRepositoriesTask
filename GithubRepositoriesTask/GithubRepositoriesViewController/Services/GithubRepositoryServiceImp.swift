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

    func find(criteria: [String : Encodable?], completion: @escaping ([Repository]?, Error) -> Void) {
        //TODO : handle reqeuest here
    }

}
