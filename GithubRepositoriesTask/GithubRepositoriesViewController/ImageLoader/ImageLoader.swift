//
//  ImageLoader.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/4/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation
import UIKit

protocol ImageLoader {

    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void)

}
