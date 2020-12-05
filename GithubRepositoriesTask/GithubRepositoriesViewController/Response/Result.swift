//
//  Result.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/5/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

enum Result<T> {

    case success(T)
    case error(errorMessage: String)
    
}
