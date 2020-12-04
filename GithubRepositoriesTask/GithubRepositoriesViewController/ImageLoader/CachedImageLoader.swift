//
//  CachedImageLoader.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation
import UIKit

final class CachedImageLoader: ImageLoader {

    private let cacheImage: NSCache<AnyObject, AnyObject>
    private let remoteImageLoader: ImageLoader

    init(cacheImage: NSCache<AnyObject, AnyObject>, remoteImageLoader: ImageLoader) {
        self.cacheImage = cacheImage
        self.remoteImageLoader = remoteImageLoader
    }

    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            completion(cachedImage)
            return
        } else {
            self.remoteImageLoader.loadImage(urlString: urlString) { downloadedImage in
                self.saveImageToCache(image: downloadedImage, with: urlString)
                completion(downloadedImage)
            }
        }
    }

    private func saveImageToCache(image: UIImage, with key: String) {
        if image != #imageLiteral(resourceName: "avatar") {
            imageCache.setObject(image, forKey: key as NSString)
        }
    }

}
