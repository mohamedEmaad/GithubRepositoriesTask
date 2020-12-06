//
//  GithubRepoService.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

protocol GithubRepositoryServiceInterface {

    func find(criteria: [String : Any?]?, completion: @escaping (Result<[Repository]?>) -> Void)

}
