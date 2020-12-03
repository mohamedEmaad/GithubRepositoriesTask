//
//  RequestHandler.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

protocol RequestHandler {

    func execute(url: URL, requestType: RequstType, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void)

}
