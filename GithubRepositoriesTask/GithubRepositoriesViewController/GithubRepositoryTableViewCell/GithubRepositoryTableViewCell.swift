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

    func setupView(with repository: Repository) {
        self.userAvatarImage.downloaded(from: repository.owner?.avatar_url ?? "")
        self.userNameLabel.text = repository.owner?.login
        self.repositoryNameLabel.text = repository.name
    }
    
}
