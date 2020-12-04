//
//  Error.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

enum MainError: Error {

    case invalidUrl
    case offline
    case responseError(message: String)

    func getErrorMessage() -> String {
        switch self {
        case .invalidUrl:
            return "The connection is offline"
        case .offline:
            return "Invalid url"
        case .responseError(let message):
            return message
        }
    }
    
}
