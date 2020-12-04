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
    private let requestFilterer: RequestFilterer

    init(requestHandler: RequestHandler, responseDecoder: ResponseDecoder, requestFilterer: RequestFilterer) {
        self.requestHandler = requestHandler
        self.responseDecoder = responseDecoder
        self.requestFilterer = requestFilterer
    }

    func find(url: URL, with criteria: [String: Any?]?, completion: @escaping ([Repository]?, Error?) -> Void) {
        requestHandler.execute(url: url, requestType: .get, body: nil) { (data, response, error) in
            var _error: Error? = nil
            var _repositories: [Repository]? = nil
            if let error = error {
                _error = error
            } else if let data = data {
                let allRepositories: [Repository]? = self.responseDecoder.decode(of: [Repository].self, data: data)
                _repositories = self.requestFilterer.filter(list: allRepositories, with: criteria)
                _repositories?.forEach({ $0.date = Date.randomDate(daysBack: 2000)?.toString() })
            } else {
                _error =  MainError.responseError(message: "Something went wrong please try again later")
            }
            DispatchQueue.main.async {
                completion(_repositories, _error)
            }
        }
    }

}
