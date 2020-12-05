//
//  SingleRepoViewController.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/5/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

class SingleRepoViewController: UIViewController {

    @IBOutlet private weak var userAvatarImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var privateImageView: UIImageView!
    @IBOutlet private weak var privateLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    private var repository: Repository

    init(repository: Repository) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
