//
//  GithubRepositoriesFetcher.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubFetcher: RequestHandler {

    private var headers: [String: String]?
    private var lastTask: URLSessionDataTask?

    init(headers: [String: String]?) {
        self.headers = headers
    }

    func execute(url: URL, requestType: RequstType, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.lastTask?.cancel()
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        (self.headers ?? [:]).forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        self.lastTask = URLSession.shared.dataTask(with: request, completionHandler: completion)
        lastTask?.resume()
    }

}
