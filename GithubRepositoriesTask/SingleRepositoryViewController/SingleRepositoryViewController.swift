//
//  SingleRepoViewController.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/5/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

class SingleRepositoryViewController: UIViewController {

    @IBOutlet private weak var userAvatarImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var privateImageView: UIImageView!
    @IBOutlet private weak var privateLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    private var repository: Repository
    private var imageLoader: ImageLoader

    init(repository: Repository, imageLoader: ImageLoader) {
        self.repository = repository
        self.imageLoader = imageLoader
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialView()
    }

    private func setupInitialView() {
        self.setupImage()
        self.setupPrivateView()
        self.usernameLabel.text = self.repository.owner?.login
        self.repositoryNameLabel.text = self.repository.full_name
        self.dateLabel.text = self.repository.date
        self.descriptionLabel.text = self.repository.description
    }

    private func setupImage() {
        self.imageLoader.loadImage(urlString: self.repository.owner?.avatar_url ?? "") { (image) in
            self.userAvatarImageView.image = image
        }
    }

    private func setupPrivateView() {
        if self.repository.privateRepo ?? false {
            self.privateImageView.image = UIImage(systemName: "lock")
            self.privateLabel.text = "Private"
        } else {
            self.privateImageView.image = UIImage(systemName: "lock.open")
            self.privateLabel.text = "Public"
        }
    }

}
