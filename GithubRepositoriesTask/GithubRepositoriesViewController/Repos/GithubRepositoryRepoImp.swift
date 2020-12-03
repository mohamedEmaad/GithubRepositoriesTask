//
//  GithubRepositoryRepoImp.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoryRepoImp: GithubRepositoryRepo {

    private let requestHandler: RequestHandler
    private let responseDecoder: ResponseDecoder

    init(requestHandler: RequestHandler, responseDecoder: ResponseDecoder) {
        self.requestHandler = requestHandler
        self.responseDecoder = responseDecoder
    }

    func find(body: Data?, completion: @escaping ([Repository]?, Error?) -> Void) {
        guard let url: URL = URL(string: "https://api.github.com/repositories") else {
            completion(nil, MainError.invalidUrl)
            return
        }
        requestHandler.execute(url: url, requestType: .get, body: body) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                let repositories: [Repository]? = self.responseDecoder.decode(of: [Repository].self, data: data)
                completion(repositories, nil)
            } else {
                completion(nil, MainError.responseError(message: "Something went wrong please try again later"))
            }

        }
    }
    
}
