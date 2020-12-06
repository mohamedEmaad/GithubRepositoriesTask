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

            if postImageURL == nil {
                self.userAvatarImage.image = nil
                return
            }
            self.userAvatarImage.image = #imageLiteral(resourceName: "avatar")
            let url: String = postImageURL!
            imageLoader?.loadImage(urlString: url) { image in
                if url != self.postImageURL {

                    return
                }
                DispatchQueue.main.async {
                    self.userAvatarImage.image = image
                }
            }
        }
    }
    
    func setupView(with repository: Repository, imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
        self.postImageURL = repository.owner?.avatar_url
        self.userNameLabel.text = repository.owner?.login
        self.repositoryNameLabel.text = repository.name
        self.respositoryDateLabel.text = repository.date
    }
    
}
