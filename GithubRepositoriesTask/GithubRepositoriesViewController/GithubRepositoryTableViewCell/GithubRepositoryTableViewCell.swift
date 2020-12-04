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
        self.respositoryDateLabel.text = self.convertDateFormater(date: repository.date ?? "")
    }

    func convertDateFormater(date: String) -> String {
        guard let filteredDate = date.toDate else {
            return date
        }
        let diffComponents: DateComponents = Calendar.current.dateComponents([.month], from: filteredDate, to: Date())
        if diffComponents.month ?? 0 > 6 {
            return MoreThanSixMonthDateFormatter.formatedData(date: filteredDate)
        } else {
            return LessThanSixMonthDateFormatter.formatedData(date: filteredDate)
        }
    }
    
}
