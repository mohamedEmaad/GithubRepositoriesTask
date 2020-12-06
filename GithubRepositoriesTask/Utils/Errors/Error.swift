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
        case .offline:
            return "ConnectionOffline:Error".localized
        case .invalidUrl:
            return "CallApi:InvalidUrl".localized
        case .responseError(let message):
            return message
        }
    }
    
}
