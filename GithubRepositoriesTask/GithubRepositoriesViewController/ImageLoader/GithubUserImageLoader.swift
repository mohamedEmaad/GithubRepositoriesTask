//
//  GithubUserAvatarImageLoader.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation
import UIKit

final class GithubUserImageLoader: ImageLoader {

    private let requestHandler: RequestHandler

    init(requestHandler: RequestHandler) {
        self.requestHandler = requestHandler
    }

    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString)  else {
            completion(#imageLiteral(resourceName: "avatar"))
            return
        }
        self.requestHandler.execute(url: url, requestType: .get, body: nil) { (data, response, error) in
            if let _ = error {
                completion(#imageLiteral(resourceName: "avatar"))
                return
            }
            if let downloadedImage = UIImage(data: data!) {
                completion(downloadedImage)
            }
        }
    }

}
