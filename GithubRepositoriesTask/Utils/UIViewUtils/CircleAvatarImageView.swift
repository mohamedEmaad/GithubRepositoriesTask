//
//  CircleAvatarImageView.swift
//  GithubRepositoriesTask
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import UIKit

class CircleAvatarImageView: UIImageView {

    override func layoutSubviews() {
        self.clipsToBounds = true
        let cornerRaduies: CGFloat = self.frame.size.height / 2
        self.layer.cornerRadius = cornerRaduies
    }

}
