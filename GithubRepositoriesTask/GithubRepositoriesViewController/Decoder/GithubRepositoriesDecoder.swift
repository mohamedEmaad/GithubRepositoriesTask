//
//  GithubRepositoriesEncoder.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

final class GithubRepositoriesDecoder: ResponseDecoder {

    func decode<T>(of type: T.Type, data: Data) -> T? where T : Decodable {
        let encodedData: T? = try? JSONDecoder().decode(type, from: data)
        return encodedData
    }
    
}
