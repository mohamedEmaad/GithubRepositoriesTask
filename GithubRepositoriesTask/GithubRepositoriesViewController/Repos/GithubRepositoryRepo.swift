//
//  GithubRepositoryRepo.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

protocol GithubRepositoryRepo {

    func find(body: Data?, completion: @escaping ([Repository]?, Error?) -> Void)

}
