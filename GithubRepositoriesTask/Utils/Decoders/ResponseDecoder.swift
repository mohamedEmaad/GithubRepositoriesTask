//
//  ResponseDecoder.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

protocol ResponseDecoder {

    func decode<T: Decodable>(of type: T.Type, data: Data) -> T?

}
