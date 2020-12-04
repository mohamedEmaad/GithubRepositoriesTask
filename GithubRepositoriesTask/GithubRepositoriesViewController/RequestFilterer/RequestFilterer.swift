//
//  RequestFilterer.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

protocol RequestFilterer {

    func filter(list: [Repository]?, with criteria: [String: Any?]?) -> [Repository]?

}
