//
//  GithubRepositoryTableViewCell.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

final class GithubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var userAvatarImage: CircleAvatarImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var respositoryDateLabel: UILabel!
    private var imageLoader: ImageLoader?

    private var postImageURL: String? {
        didSet {
            if let url = postImageURL {
                self.userAvatarImage.image = #imageLiteral(resourceName: "avatar")
                imageLoader?.loadImage(urlString: url) { image in
                    if url == self.postImageURL {
                        DispatchQueue.main.async {
                            self.userAvatarImage.image = image
                        }
                    }
                }
            }
            else {
                self.userAvatarImage.image = nil
            }
        }
    }
    
    func setupView(with repository: Repository, imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
        self.postImageURL = repository.owner?.avatar_url
        self.userNameLabel.text = repository.owner?.login
        self.repositoryNameLabel.text = repository.name
    }
    
}
