//
//  GithubRepositoryRequestFilterer.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryRequestFilterer: RequestFilterer {

    func filter(list: [Repository]?, with criteria: [String : Any?]?) -> [Repository]? {
        if let keyword: String = criteria?["keyword"] as? String {
            return list?.filter({ $0.name?.contains(keyword) ?? false })
        }
        return list
    }

}
