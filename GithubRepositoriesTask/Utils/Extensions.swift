//
//  Extensions.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

extension String {

    @inlinable static var baseUrl: Self {
        "https://api.github.com/"
    }
    
}

extension Error {

    func getErrorMessage() -> String {
        switch self {
        case let self as MainError:
            return self.getErrorMessage()
        default:
            return self.localizedDescription
        }
    }

}

let imageCache: NSCache<AnyObject, AnyObject> = NSCache()
